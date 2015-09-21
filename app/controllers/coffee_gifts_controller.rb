class CoffeeGiftsController < ApplicationController

	before_action :authenticate_user, except: [:update]
	before_action :authorize_user, only: [:show]
	before_action :find_coffee_gift, except: [:new, :create]

	def new
		@cafe = Cafe.find_by(id: params[:cafe_id])
		@menu_items = @cafe.menu_items
		@receivers = User.all
		@coffee_gift = CoffeeGift.new
	end

	def create
		coffee_gift = current_user.given_coffees.build(coffee_gift_params)
		prepare_and_send_payment
		cc = CreditCard.new(params["cc"])
		transaction = BraintreePayment.new(coffee_gift, cc)
		send_payment(transaction)
		if coffee_gift.save && send_payment(transaction)
			text = TwilioTextSender.new(coffee_gift)
			text.send!
			redirect_to confirmation_path(coffee_gift)
		else
			redirect_to new_cafe_coffee_gift_path(@cafe)
		end
	end

	def update
		if @coffee_gift.update_attributes(redeemed: true)
			flash[:notice] = "Coffee Redeemed!"
			redeem_text = TwilioTextSender.new(@coffee_gift)
			redeem_text.send!
			redirect_to cafes_profile_path
		else
			flash[:error] = ["Unable to redeem voucher"]
			redirect_to cafes_profile_path
		end
	end

	def show
		@cafe = @coffee_gift.cafe
	end

	def confirm
		@cafe = @coffee_gift.cafe
	end

	private

	def send_payment(transaction)
		result = transaction.send_payment!
		if result.success?
      @transaction_id = result.transaction.id
      flash[:notice] = "Transaction successful. Your confirmation number is #{@transaction_id}."
    	return true
    elsif result.transaction
      @processor_response_code = result.transaction.processor_response_code
      @processor_response_text = result.transaction.processor_response_text
      flash[:error] = ["Error processing transaction:
        code: #{@processor_response_code}
        text: #{@processor_response_text}"]
        return false
    else
      errors = result.errors.to_a.last.message
      flash[:error] = ["Errors processing transaction: #{errors}"]
      return false
    end
	end

	def find_coffee_gift
		@coffee_gift = CoffeeGift.find_by(id: params[:id])
	end

	def authorize_user
		find_coffee_gift
		redirect_to root_path unless current_user.received_coffee?(@coffee_gift)
	end

	def authenticate_user
		unless current_user
			flash[:error] = ["Please login to send coffee."]
			redirect_to root_path
		end
	end

	def coffee_gift_basic_params
		params.require(:coffee_gift).permit(:message, :phone)
	end

	def coffee_gift_params
		receiver = User.find_by(username: params[:coffee_gift][:receiver]) || User.find_by(phone: params[:coffee_gift][:phone])
		menu_item = MenuItem.find_by(id: params[:coffee_gift][:menu_item])
		coffee_gift_basic_params.merge(receiver: receiver, menu_item: menu_item)
	end

end
