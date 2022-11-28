
def prompt(msg)
  puts "=> #{msg}"
end

loop do
  prompt("Welcome to Madlibs!")

  items_to_collect = ['noun', 'verb','adjective','adverb']

  collect_items = {}

  items_to_collect.each do |n|
    prompt("Please enter a #{n}")
    item = gets.chomp.to_s
    collect_items[n] = item
  end

  prompt("Do you #{collect_items['verb']} your #{collect_items['adjective']} #{collect_items['noun']} #{collect_items['adverb']}? That's hilarious!")

  prompt("Play again? Y/N")
  cont = gets.chomp.to_s
  break if !cont.downcase.start_with? 'y'
end

prompt("Goodbye!")
