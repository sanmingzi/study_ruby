class Resource
  INIT_VAL = 0

  def initialize
    @num = INIT_VAL
    @mutex = Mutex.new
  end

  def out_sync?
    @num != INIT_VAL
  end

  [:inc, :dec].each do |method|
    define_method method do
      tmp = @num
      sleep 0.00001
      method == :inc ? @num = tmp + 1 : @num = tmp - 1
    end

    method_name = "#{method}_with_mutex"
    define_method method_name do
      @mutex.synchronize { self.send(method) }
    end
  end
end

r = Resource.new

[:inc, :dec].each do |method|
  puts method
  r.send(method)
  puts r.inspect
  method = "#{method}_with_mutex"
  puts method
  r.send(method)
  puts r.inspect
end

def test_resource(with_mutex = false)
  r = Resource.new
  t1 = Thread.new {
    5000.times {
      with_mutex ? r.inc_with_mutex : r.inc
      sleep 0.00001
    }
  }
  t2 = Thread.new {
    5000.times {
      with_mutex ? r.dec_with_mutex : r.inc
      sleep 0.00001
    }
  }
  t1.join
  t2.join
  puts r.inspect
  if r.out_sync?
    puts 'sorry, the resource out sync'
  else
    puts 'congratulation!'
  end
end
