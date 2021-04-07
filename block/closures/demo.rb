# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

def my_method
  yield
end

my_method { puts 'this is a closures' }

x = 1
my_method { puts "x: #{x}"}
