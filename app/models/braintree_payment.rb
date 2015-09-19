class BraintreePayment
  attr_reader :transaction_id
  attr_reader :processor_response_code, :processor_response_text

  def initialize(coffee_gift)
    configure_environment
    @coffee_gift = coffee_gift
    @credit_card = CreditCard.new({num: "5105105105105100", exp:"05/12"}) # hardcoded for testing
    @transaction_id = nil
    @processor_response_code = nil
    @processor_response_code = nil
  end

  def configure_environment
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.merchant_id = "k6xzvgt3mb7gx22w"
    Braintree::Configuration.public_key = "dxv52q66dj2q6tbf"
    Braintree::Configuration.private_key = "8ae5f3d3307c7e7c7dd69140f51c5859"
  end

  def send_payment!
    result = Braintree::Transaction.sale(
      :amount => @coffee_gift.price,
      :credit_card => {
        :number => @credit_card.number,
        :expiration_date => @credit_card.expiration_date
      }
    )

    if result.success?
      @transaction_id = result.transaction.id
      flash[:notice] = "Your confirmation number is #{@transaction_id}."
    elsif result.transaction
      @processor_response_code = result.transaction.processor_response_code
      @processor_response_text = result.transaction.processor_response_text
      flash[:error] = "Error processing transaction:
        code: #{@processor_response_code}
        text: #{@processor_response_text}"
    else
      errors = result.errors
      flash[:error] = "Errors processing transaction: #{errors}"
    end
  end
end



