class TwilioTextSender 

	def initialize(coffee_gift)
		configure_client
		@client = Twilio::REST::Client.new
		@coffee_gift = coffee_gift
	end

	def configure_client
		account_sid = 'ACf56291e066dcd809e0983ac5e491b499'
		auth_token = 'b0b59b6b759eeb2713fc6137a19e726f'

		Twilio.configure do |config|
		  config.account_sid = account_sid
		  config.auth_token = auth_token
		end
	end	

	def send!
		begin
			@client.account.messages.create({
				from: '+12178074310', 
				to: @coffee_gift.receiver.phone, 
				body: @coffee_gift.message
			})
		rescue Twilio::REST::RequestError => e
			puts e.message
		end	
	end	

end	