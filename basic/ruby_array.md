# Ruby Array

## 优点 / 缺点

- 优点

ruby 里面的 array 功能十分强大，其类似于 c++ 中的 vector 可变长度数组，并且还能提供 stack / queue 的 pop / push / shift 等各种方法。ruby 中并未单独提供 stack / queue 等基础数据结构，所有的这些数据结构都可以用 array 来实现。

- 缺点

1. 性能堪忧。由于 ruby 的 array 糅合了各种数据结构的功能，所以导致维护 array 的代价比较大。
2. 没有固定长度的数组。即使你定义了一个固定长度的数组，但是该数组依然是可变长度的。这样也将导致性能降低。参考代码 [array.rb](src/array.rb)

## Init two dimensional array

- error

If we use this way to init the two dimensional array, when we modify data in one row and one column, the other data in the same column will also be modified.

```ruby
data = Array.new(3, Array.new(2, 0))
data[1][1] = 1
print data
0 1
0 1
0 1
```

- right

```ruby
data = Array.new(3) {Array.new(2, 0)}
data[1][1] = 1
print data
0 0
0 1
0 0
```

## Compare

```ruby
[0] <=> [0]
# => 0

[0] <=> [1]
# => -1

[0] <=> [-1]
# => 1

[0, 1, 2] <=> [0, 1, 2]
# => 0

[0] <=> [0, 1, 2]
# => -1

[0] <=> [-1, 0, 1, 2]
# => 1
```

## Reference

- http://blog.sina.com.cn/s/blog_4ee2627701010f39.html
- https://docs.ruby-lang.org/en/2.0.0/Array.html