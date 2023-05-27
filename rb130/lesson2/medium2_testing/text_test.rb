require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!


require_relative 'text'

class TextTest < MiniTest::Test

  def setup
    @file = File.open('sample_text.txt')
    @text = Text.new(@file.read)
  end

  def test_swap
    swapped_text = @text.swap("o", "i")
    refute_includes('o', swapped_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end

end

