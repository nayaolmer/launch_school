


def greetings(name_arr, job_hash)
  "Hello, #{name_arr.join(' ')}! Nice to have a #{job_hash[:title]} " \
  "#{job_hash[:occupation]} around."
end





puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, John Q Doe! Nice to have a Master Plumber around."
