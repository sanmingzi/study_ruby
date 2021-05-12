# 运算符 (Operator)

- [operator.rb](src/operator.rb)

## 逻辑运算

## 位运算

```ruby
# & | ^ ~ << >>
a, b = 1, 2
puts "a & b = #{a & b}"
puts "a | b = #{a | b}"
puts "a ^ b = #{a ^ b}"
puts "~a = #{~a}" # -2
puts "a >> 1 = #{a >> 1}"
puts "a << 1 = #{a << 1}"
```

主要有 6 个位运算符，与、或、异或、取反、左移、右移。这里主要讲一下取反，因为取反后可能是负数，所以判断它的值稍微麻烦一点。

```
a = 1, 二进制：00000001
~a, 二进制：11111110
~a 的二进制的首位为 1，表示一个负数，而负数的二进制码是由补码来表示的
负数的补码：其对应的正数取反后 +1
补码对应的正数应该为：补码 -1 后取反
所以该补码对应的正数为：~(11111110 - 1) = 00000010 = 2
所以该补码表示的负数为：-2
```

## 三目运算

## 一元运算符

```ruby
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
```

## & 符号

& 符号不仅具有按位与功能，还有另外一个用处，就是能够将一个对象转换为代码块。

```ruby
block = proc {
  puts 'in block'
}
self.instance_eval(&block)

arr = ['1', '2']
puts arr.collect(&:to_i).inspect
puts arr.collect(&((:to_i).to_proc)).inspect
```
