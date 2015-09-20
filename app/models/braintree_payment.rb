class BraintreePayment

  def initialize(coffee_gift, cc, exp_date)
    configure_environment
    @coffee_gift = coffee_gift
    @credit_card = CreditCard.new({num: cc, exp: exp_date}) # hardcoded for testing
  end

  def configure_environment
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "k6xzvgt3mb7gx22w"
    Braintree::Configuration.public_key = "dxv52q66dj2q6tbf"
    Braintree::Configuration.private_key = "8ae5f3d3307c7e7c7dd69140f51c5859"
  end

  def send_payment!
    Braintree::Transaction.sale(
      :amount => @coffee_gift.price,
      :credit_card => {
        :number => @credit_card.number,
        :expiration_date => @credit_card.expiration_date
      }
    )
  end
end



