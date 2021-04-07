bindings = []
bindings.push(binding)

proc = lambda {
  bindings.push(binding)
  begin
    puts a
  rescue => exception
    puts exception.message
  end
}

a = 10
bindings.push(binding)

proc.call
bindings.push(binding)

bindings.each do |b|
  puts "#{b.inspect} #{b.local_variables}"
end
