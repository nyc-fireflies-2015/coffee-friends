class CreditCard
  attr_reader :number, :expiration_date

  def initialize(args)
    @number = args[:num]
    @expiration_date = args[:exp_date]
  end
end
