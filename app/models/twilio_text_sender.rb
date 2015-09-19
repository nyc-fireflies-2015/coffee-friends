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
				to: @coffee_gift.phone, 
				body: text_body
			})
		rescue Twilio::REST::RequestError => e
			puts e.message
		end	
	end	

	def text_body
		"You received a gift of coffee from #{@coffee_gift.giver.first_name}! Visit http://google.com to redeem."
	end	

end	