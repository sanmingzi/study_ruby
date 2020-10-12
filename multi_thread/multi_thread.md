# 多线程

## Demo

[multi_thread_demo.rb](./multi_thread_demo.rb)

```ruby
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
```

- Thread.new 可以创建子线程，并且会立即开始执行
- thread.join 方法可以挂起主线程，直至子线程执行完毕

## Mutex 保证线程安全

[multi_thread_mutex.rb](./multi_thread_mutex.rb)

```ruby
@tickets_index = 0
@tickets_nums = 15
@mutex = Mutex.new

def buy_ticket(customer, nums)
  nums.times do |index|
    @mutex.lock
    if @tickets_index >= @tickets_nums
      puts "Sorry, #{customer}, you can not buy the #{index}'s ticket, not enough ticket"
    else
      puts "OK, #{customer}, you buy the #{index}'s ticket, the ticket number is #{@tickets_index}"
      @tickets_index += 1
    end
    @mutex.unlock
    sleep(0.1)
  end
end

t1 = Thread.new{buy_ticket('customer0', 10)}
t2 = Thread.new{buy_ticket('customer1', 10)}
t1.join
t2.join
```

## 死锁

[multi_thread_dead_mutex.rb](./multi_thread_dead_mutex.rb)

```ruby
@mutex0 = Mutex.new
@mutex1 = Mutex.new

def buy_ticket(customer, nums, mutex0, mutex1)
  nums.times do |index|
    mutex0.synchronize do
      puts "#{customer} lock the #{mutex0.object_id}"
      mutex1.synchronize do
        puts "#{customer} lock the #{mutex1.object_id}"
      end
      puts "#{customer} unlock the #{mutex1.object_id}"
    end
    puts "#{customer} unlock the #{mutex0.object_id}"
    sleep(0.1)
  end
end

t1 = Thread.new{buy_ticket('customer0', 5, @mutex0, @mutex1)}
t2 = Thread.new{buy_ticket('customer1', 5, @mutex1, @mutex0)}
t1.join
t2.join
```
