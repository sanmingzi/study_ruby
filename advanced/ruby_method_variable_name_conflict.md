# Ruby name conflict between method and variable

## Demo

```ruby
def something
  p 'hellp something'
  'hello'
end

p something + 'xx'
p '-----------'
something = something + 'xx'
```

上述代码执行到最后一句的时候会报错，理解如下：

- ruby解析器会从左往右解析最后一句代码
- 首先ruby会读取到第1个`something`，因为其后面跟了`=`，这是一个赋值操作，所以ruby会认为`something`是一个变量，而该变量之前并没有定义过，所以该变量的值为nil
- 接着ruby会读取到第2个`something`，ruby此时并不清楚这是一个变量还是一个方法，于是向前查找，然后就找到了前面定义过的同名变量，值为nil，nil + 'xx'，所以报错
 
## Conclusion

- 如果解析器看到标识符在使用前被赋值（标识符后面紧跟"="），就认为该标识符是变量。
- 当不确定标识符是变量还是方法的时候，ruby会向前查找同名的方法或者变量
