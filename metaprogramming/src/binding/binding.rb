# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

puts "local_variables: #{local_variables.inspect}"

class Binding
  def say
    puts self.local_variables.inspect
    puts "receiver: #{self.receiver}"
    self.local_variables.each do |v|
      puts "#{v} is defined: #{self.local_variable_defined?(v)}"
      puts "#{v} = #{self.eval(v.to_s).inspect}"
      puts "#{v} = #{self.local_variable_get(v)}"
    end
    puts '------'
  end
end

binding.say
lambda {
  binding.say
  # puts a
}.call

a = 10
binding.say

puts local_variables.inspect
