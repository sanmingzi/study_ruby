begin
  raise 'simple exception'
rescue => exception
  puts exception.class
  puts exception.message
end
