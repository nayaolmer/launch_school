require "Time"

def after_midnight(user_input)
  reference_midnight = Time.mktime(2022, 11, 11, 0, 0)
  user_hours, user_minutes = user_input.split(':').map(&:to_i)
  new_time = Time.mktime(2022, 11, 11, user_hours, user_minutes)

  after_midnight = (new_time - reference_midnight)/60
  after_midnight = 0 if after_midnight == 1440

  after_midnight

end

def before_midnight(user_input)
  reference_midnight = Time.mktime(2022, 11, 11, 0, 0)
  user_hours, user_minutes = user_input.split(':').map(&:to_i)
  new_time = Time.mktime(2022, 11, 10, user_hours, user_minutes)
  before_midnight = (reference_midnight - new_time)/60
  before_midnight = 0 if before_midnight == 1440

  before_midnight
end





puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0


