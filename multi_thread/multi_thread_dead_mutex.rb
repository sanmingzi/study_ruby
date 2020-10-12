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

t1 = Thread.new{buy_ticket('customer0', 1, @mutex0, @mutex1)}
t2 = Thread.new{buy_ticket('customer1', 1, @mutex1, @mutex0)}
t1.join
t2.join
