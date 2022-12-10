

ADJECTIVES = %w(quick lazy sleepy ugly)
NOUNS = %w(fox dog head leg)
VERBS = %w(jumps lifts bites licks)
ADVERBS = %w(easily lazily noisily excitedly)

# MADLIBS_HASH = {"adjective" => %w(quick lazy sleepy ugly),
#                 "noun" => %w(fox dog head leg),
#                 "verb" => %w(jumps lifts bites licks),
#                 "adverb" => %w(easily lazily noisily excitedly)}



# def replace_word(text_input, word_type)
#   words = MADLIBS_HASH[word_type]
#   loop do
#     break if !text_input.match?("%{#{word_type}}")
#     text_input = text_input.sub("%{#{word_type}}", words.sample)
#   end
#   text_input
# end

# def madlib(some_file)
#   some_text = File.read(some_file)
#   some_text = replace_word(some_text, 'adjective')
#   some_text = replace_word(some_text, 'noun')
#   some_text = replace_word(some_text, 'verb')
#   some_text = replace_word(some_text, 'adverb')
# end

# puts madlib('madlibs.txt')


### Answer

def madlib(some_file)
  text = File.open(some_file)
  text.each do |line|
    puts format(line, noun: NOUNS.sample,
                      verb: VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb: ADVERBS.sample)
  end
end

madlib('madlibs.txt')


