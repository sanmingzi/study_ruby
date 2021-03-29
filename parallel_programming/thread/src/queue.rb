
queue = Queue.new

producer = Thread.new {
  10.times {
    num = rand(1000)
    puts "produce #{num}"
    queue.push(num)
    sleep 1
  }
  queue.push(nil)
}

consumer = Thread.new {
  loop do
    num = queue.pop
    break if nil == num
    puts "consume #{num}"
  end
}

consumer.join
