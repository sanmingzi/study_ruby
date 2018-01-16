# Ruby array

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

## Reference

- http://blog.sina.com.cn/s/blog_4ee2627701010f39.html
- https://docs.ruby-lang.org/en/2.0.0/Array.html