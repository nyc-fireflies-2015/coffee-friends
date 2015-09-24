class TransactionsController < ApplicationController

  def new
    @coffee_gift = CoffeeGift.find_by(id: session[:tmp_id])
    authenticate_user
    authorize_user
    gon.client_token = TransactionHandler.generate_client_token
  end

  def create
    result = TransactionHandler.send_payment!(session, params)
    if result.success?
      flash[:notice] = "Success!"
      @coffee_gift = CoffeeGift.find_by(id: session[:tmp_id])
      flash[:twilio_error] = TwilioTextSender.send!(@coffee_gift)
      redirect_to confirmation_path(@coffee_gift)
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = TransactionHandler.generate_client_token
      render :new
    end
  end

  private

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


