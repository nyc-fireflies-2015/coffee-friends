class TransactionsController < ApplicationController

  def new
    @coffee_gift = CoffeeGift.find_by(id: session[:tmp_id])
    authenticate_user
    authorize_user
    gon.client_token = generate_client_token
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: session[:tmp_price],
              payment_method_nonce: params[:payment_method_nonce])
    session[:tmp_price] = nil
    if @result.success?
      flash[:notice] = "Your transaction was successful!"
      @coffee_gift = CoffeeGift.find_by(id: session[:tmp_id])
      session[:tmp_id] = nil
      TwilioTextSender.send!(@coffee_gift)
      redirect_to confirmation_path(@coffee_gift)
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.logger = Logger.new('log/braintree.log')
    Braintree::Configuration.merchant_id = ENV['braintree_merchant_id']
    Braintree::Configuration.public_key = ENV['braintree_public_key']
    Braintree::Configuration.private_key = ENV['braintree_private_key']
    Braintree::ClientToken.generate
  end

  def authorize_user
    unless current_user.sent_or_received_coffee?(@coffee_gift)
      redirect_to root_path
    end
  end

  def authenticate_user
    unless current_user
      flash[:error] = ["Please login to send coffee."]
      redirect_to root_path
    end
  end

end


