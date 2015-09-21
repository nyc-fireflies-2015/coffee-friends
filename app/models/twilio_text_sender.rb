class TwilioTextSender

	def initialize(coffee_gift)
		configure_client
		@client = Twilio::REST::Client.new
		@coffee_gift = coffee_gift
	end

	def configure_client
		account_sid = ENV["twilio_account_sid"]
		auth_token = ENV["twilio_auth_token"]

		Twilio.configure do |config|
		  config.account_sid = account_sid
		  config.auth_token = auth_token
		end
	end

	def send!
		@coffee_gift.redeemed ? send_text(redeem_message) : send_text(receive_message)
	end

	def send_text(text_body)
		begin
			@client.account.messages.create({
				from: ENV["twilio_phone"],
				to: @coffee_gift.phone,
				body: text_body
			})
		rescue Twilio::REST::RequestError => e
			puts e.message
		end
	end

	def receive_message
		"You received a gift of coffee from #{@coffee_gift.giver.first_name}! Visit http://google.com to redeem."
	end

	def redeem_message
		"Your coffee has been redeemed! Do something nice and maybe someone will buy you another one."
	end

end
