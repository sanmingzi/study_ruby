def fun1
  for i in (0...3) do
    puts "fun1 in time: #{Time.now}, current_thread: #{Thread.current}"
    sleep(1)
  end
end

def fun2
  for i in (0...3) do
    puts "fun2 in time: #{Time.now}, current_thread: #{Thread.current}"
    sleep(1)
  end
end

t1 = Thread.new{fun1}
t2 = Thread.new{fun2}
t1.join
t2.join
