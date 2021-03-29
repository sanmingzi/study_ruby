# 异常 Exception

```ruby
begin
# ...
rescue => ex
# ...
ensure
# ...
end
```

rescue 可以指定需要捕获的 exception 类型，默认为 StandardError 。我们在代码中也可以 raise exception ，默认 raise 的类型为 RuntimeError 。RuntimeError 是 StandardError 的子类。

[simple_demo.rb](src/simple_demo.rb)

## 非 StandardError

Exception 的子类除了 StandardError 之外还有其他的更严重的 error ，比如 NoMemoryError / SystemStackError 等等，如果出现这些 exception 说明已经出现了非常严重的问题，需要立即进行修复。所以这些非 StandardError 不应该被捕获。

[stack_error.rb](src/stack_error.rb)
