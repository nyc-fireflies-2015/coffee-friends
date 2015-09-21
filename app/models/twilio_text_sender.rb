module TwilioTextSender

	extend self

	def configure_client
		account_sid = ENV["twilio_account_sid"]
		auth_token = ENV["twilio_auth_token"]

		Twilio.configure do |config|
		  config.account_sid = account_sid
		  config.auth_token = auth_token
		end

		@client = Twilio::REST::Client.new
	end

	def send!(coffee_gift)
		coffee_gift.redeemed ? send_text(coffee_gift, redeem_message) : send_text(coffee_gift, receive_message(coffee_gift))
	end

	def send_text(coffee_gift, text_body)
		configure_client
		begin
			@client.account.messages.create({
				from: '+12178074310',
				to: coffee_gift.phone,
				body: text_body
			})
		rescue Twilio::REST::RequestError => e
			puts e.message
		end
	end

	def receive_message(coffee_gift)
		"You received a gift of coffee from #{coffee_gift.giver.first_name}! Visit http://google.com to redeem."
	end

	def redeem_message
		"Your coffee has been redeemed! Do something nice and maybe someone will buy you another one."
	end

end
