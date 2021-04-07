def my_block
  x = 1
  inc = lambda { x += 1 }
  show = lambda { x }
  [inc, show]
end

inc, show = my_block
puts inc.call
puts inc.call
puts show.call

[1, 2].each(&lambda { |num| puts num })

def test_proc(p1, p2)
  p1.call
  p2.call
end

x = 10
p1 = proc { puts "x is: #{x}" }
p2 = proc { puts "x * 10 is: #{x * 10}" }
test_proc(p1, p2)
