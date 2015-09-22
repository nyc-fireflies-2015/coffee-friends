class TransactionsController < ApplicationController
  before_action :authenticate_user, :authorize_user

  def new
    gon.client_token = generate_client_token
  end

  def create
    binding.pry
    @result = Braintree::Transaction.sale(
              amount: current_user.cart_total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      binding.pry
      # send somewhere helpful, like the coffee_gift create
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
      binding.pry
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end

  def find_coffee_gift
    @coffee_gift = CoffeeGift.find_by(id: params[:id])
  end

  def authorize_user
    find_coffee_gift
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
