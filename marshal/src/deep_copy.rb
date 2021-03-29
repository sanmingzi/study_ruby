arr = Array.new(3) { Array.new(3, 0) }
arr_copy = Marshal.load(Marshal.dump(arr))
puts arr.inspect
puts arr_copy.inspect
puts "arr.object_id == arr_copy.object_id is #{arr.object_id == arr_copy.object_id}"

puts 'change arr[0][0] = 1'
arr[0][0] = 1
puts arr.inspect
puts arr_copy.inspect

puts 'change arr_copy[0][0] = -1'
arr_copy[0][0] = -1
puts arr.inspect
puts arr_copy.inspect
