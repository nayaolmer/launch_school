require 'pry'


some_file = 'pg84.txt'
file = File.open(some_file)
file_data = file.read

binding.pry