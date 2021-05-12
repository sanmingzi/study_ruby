

a, b = 1, 2
puts "a & b = #{a & b}"
puts "a | b = #{a | b}"
puts "a ^ b = #{a ^ b}"
puts "~a = #{~a}"
puts "a >> 1 = #{a >> 1}"
puts "a << 1 = #{a << 1}"

class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def +@
    dup
  end

  def -@
    self.class.new(-x, -y)
  end

  def ~@
    self.class.new(-y, x)
  end
end

p = Point.new(1, 2)
puts (+p).inspect
puts (-p).inspect
puts (~p).inspect

# &
block = proc {
  puts 'in block'
}
self.instance_eval(&block)

arr = ['1', '2']
puts arr.collect(&:to_i).inspect
puts arr.collect(&((:to_i).to_proc)).inspect
