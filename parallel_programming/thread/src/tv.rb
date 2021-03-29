require 'sync'

class TV
  def initialize
    @sync = Sync.new
    @channel = 0
  end

  def start_watch
    @sync.lock(:SH)
    puts "Start watching tv-#{@channel}"
    sleep 2
  end

  def end_watch
    puts "End watching tv-#{@channel}"
    @sync.unlock(:SH)
    sleep 0.1
  end

  [:inc, :dec].each do |method|
    define_method method do
      @sync.synchronize(:EX) {
        tmp = @channel
        sleep 0.1
        @channel = (method == :inc ? tmp + 1 : tmp - 1)
        puts "change channel to #{@channel}"
      }
    end
  end
end

def test_tv
  tv = TV.new
  [
    Thread.new { 3.times { tv.start_watch; tv.end_watch } },
    Thread.new { 10.times { tv.inc } },
    Thread.new { 10.times { tv.dec } }
  ].each(&:join)
  puts tv.inspect
end

test_tv
puts '-----------------'

class TV
  def initialize
    @mutex = Mutex.new
    @channel = 0
  end

  def start_watch
    @mutex.lock
    puts "Start watching tv-#{@channel}"
    sleep 2
  end

  def end_watch
    puts "End watching tv-#{@channel}"
    @mutex.unlock
    sleep 0.1
  end

  [:inc, :dec].each do |method|
    define_method method do
      @mutex.synchronize {
        tmp = @channel
        sleep 0.1
        @channel = (method == :inc ? tmp + 1 : tmp - 1)
        puts "change channel to #{@channel}"
      }
    end
  end
end

test_tv
