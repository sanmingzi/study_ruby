Thread.new {
  3.times {
    puts 'thread 1'
    sleep 1
  }
}

5.times {
  puts 'main thread'
  sleep 2
}

Thread.new {
  3.times {
    puts 'thread 2'
    sleep 1
  }
}.join

5.times {
  puts 'main thread again'
  sleep 1
}