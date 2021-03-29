def recursion
  recursion
end

begin
  recursion
rescue Exception => exception
  puts exception.class
  puts exception.message
end

begin
  recursion
rescue => exception
  puts exception.class
  puts exception.message
end
