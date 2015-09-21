class BraintreePayment

  def initialize(coffee_gift, credit_card)
    configure_environment
    @coffee_gift = coffee_gift
    @credit_card = credit_card
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

  def send_payment(flash)
    result = send_payment!
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
end



