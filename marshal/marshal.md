# 序列化 Marshal

Marshal 模块提供序列化和反序列化的功能，能够将任何 object 转换为 byte 序列，也能够通过 byte 序列恢复 object 。

```ruby
dump # 序列化
load # 恢复
```

## 深拷贝 (Deep Copy)

```ruby
obj2 = Marshal.load(marshal.dump(obj1))
```

[deep_copy.rb](src/deep_copy.rb)
