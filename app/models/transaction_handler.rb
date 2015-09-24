module TransactionHandler

  extend self

  def generate_client_token
    Braintree::Configuration.environment = :sandbox
    Braintree::Configuration.logger = Logger.new('log/braintree.log')
    Braintree::Configuration.merchant_id = ENV['braintree_merchant_id']
    Braintree::Configuration.public_key = ENV['braintree_public_key']
    Braintree::Configuration.private_key = ENV['braintree_private_key']
    Braintree::ClientToken.generate
  end

  def send_payment!(session, params)
    Braintree::Transaction.sale(
      amount: session[:tmp_price],
      payment_method_nonce: params[:payment_method_nonce])
  end

end



