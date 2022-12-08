

WORDS = %w( zero one two three four five six seven eight nine )
DIGITS = (0..9).to_a

WD_HASH = WORDS.zip(DIGITS).to_h


def word_to_digit(some_str)
  WD_HASH.each do |k, v|
    some_str.gsub!(/#{k}/, v.to_s)
  end
  some_str
end

def format_phone_number(some_str)
  some_str.gsub!(/(\d) (\d) (\d) (\d) (\d) (\d) (\d)/, '\1\2\3-\4\5\6\7')
end




puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
puts format_phone_number(word_to_digit('Please call me at five five five one two three four. Thanks.'))