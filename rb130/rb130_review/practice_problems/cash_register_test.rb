require "minitest/autorun"
require "minitest/reporters"
require "pry"
require 'simplecov'
SimpleCov.start

Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

  def setup
    @cash_register = CashRegister.new(1000)
    @txn1 = Transaction.new(50)
    @txn1.amount_paid = 50
    @txn2 = Transaction.new(25)
    @txn2.amount_paid = 30
  end

  def test_accept_money
    @cash_register.accept_money(@txn1)
    assert_equal(1050, @cash_register.total_money)
  end

  def test_change
    changed_amt = @cash_register.change(@txn2)
    correct_amt = @txn2.amount_paid - @txn2.item_cost
    assert_equal(correct_amt, changed_amt)
  end

  def test_give_receipt
    output_to_test = "You've paid $#{@txn2.item_cost}.\n"
    assert_output(output_to_test) { @cash_register.give_receipt(@txn2)}
  end

  def test_prompt_for_payment
    input = StringIO.new('30\n')
    output = StringIO.new
    @txn2.prompt_for_payment(input: input, output: output)
    assert_equal(30, @txn2.amount_paid)
  end


end
