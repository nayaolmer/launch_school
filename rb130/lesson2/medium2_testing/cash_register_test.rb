require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @cash_register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 120
  end

  def test_accept_money
    @cash_register.accept_money(@transaction)
    assert_equal(@cash_register.total_money, 1120)
  end

  def test_change
    assert_equal(@cash_register.change(@transaction), 20)
  end

  def test_give_receipt
    assert_output("You've paid $100.\n") {@cash_register.give_receipt(@transaction)}
  end

  def test_prompt_for_payment
    input = StringIO.new("130\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(130, @transaction.amount_paid)
  end

end

# class Transaction < MiniTest::Test

# end


