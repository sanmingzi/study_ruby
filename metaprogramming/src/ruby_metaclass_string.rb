hello_world = 'hello world'

def hello_world.upcase0
  puts "#{self.inspect}.upcase0"
  self.upcase
end

class << hello_world
  def reverse0
    puts "#{self.inspect}.reverse0"
    self.reverse
  end
end

puts hello_world.upcase0
# "hello world".upcase0
# HELLO WORLD

puts hello_world.reverse0
# "hello world".reverse0
# dlrow olleh

other_string = 'other string'
puts other_string.upcase0
# Traceback (most recent call last):
# ruby_metaclass_string.rb:19:in `<main>': undefined method `upcase0' for "other string":String (NoMethodError)
# Did you mean?  upcase
#                upcase!
