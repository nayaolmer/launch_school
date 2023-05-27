require "minitest/autorun"
require "minitest/reporters"
require "pry"
require 'simplecov'
SimpleCov.start

Minitest::Reporters.use!

require_relative 'text'


class TextTest < MiniTest::Test

  def setup
    @file = File.open('sample_text.txt')
    @file_data = @file.read
    @text = Text.new(@file_data)
  end

  def test_swap
    output_to_check = @file_data.gsub('a', 'x')
    assert_equal(output_to_check, @text.swap('a', 'x'))
  end

  def test_word_count
    correct_word_count = @file_data.split.count
    assert_equal(correct_word_count, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

end
