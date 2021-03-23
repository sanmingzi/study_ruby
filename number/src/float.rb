a = 1
b = 0
delta = 0.1
10.times { b += delta }

puts a
puts b
puts a == b
puts a - b

puts "eps: #{Float::EPSILON}"
puts a - b < Float::EPSILON
