# 闭包 (closures)

## 块

```ruby
# demo.rb
def my_method
  yield
end

my_method { puts 'this is a closures' }

x = 1
my_method { puts "x: #{x}"}
```

## 作用域

## 扁平化作用域
