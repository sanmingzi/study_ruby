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
