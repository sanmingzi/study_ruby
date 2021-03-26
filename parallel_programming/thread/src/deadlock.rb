class Resource
  def initialize
    @mutex1 = Mutex.new
    @mutex2 = Mutex.new
  end

  [:mutex1, :mutex2].each do |method|
    method_name = "#{method}_first"
    define_method method_name do
      mutex = (method == :mutex1 ? @mutex1 : @mutex2)
      another_mutex = (mutex == @mutex1 ? @mutex2 : @mutex1)
      mutex.synchronize {
        puts "use #{mutex}"
        sleep 1
        another_mutex.synchronize {
          puts "use #{another_mutex}"
        }
      }
    end
  end
end

r = Resource.new
t1 = Thread.new { 10.times { r.mutex1_first } }
t2 = Thread.new { 10.times { r.mutex2_first } }
t1.join
t2.join
