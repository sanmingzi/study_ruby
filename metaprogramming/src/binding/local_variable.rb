
puts local_variables.inspect
puts binding.local_variable_defined?(:a)
puts binding.local_variables.inspect

puts "defined? a: #{defined?(a)}"
a = 1 if false
puts "defined? a: #{defined?(a)}"
puts a.inspect
puts '+++++++++++++++++++++++++++++++++++++'

puts "defined? i: #{defined?(i)}"
for i in 0...0
end
puts "defined? i: #{defined?(i)}"
puts i
puts '+++++++++++++++++++++++++++++++++++++'

define_method :my_method do
  j = 0
end
my_method
defined?(j)
