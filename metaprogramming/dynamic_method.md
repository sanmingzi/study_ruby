# 动态方法 (Dynamic Method)

[record.rb](src/dynamic_method/record.rb)

[dynamic_method.rb](src/dynamic_method/dynamic_method.rb)

```ruby
class Record
  class << self
    def define_attr(attr)
      define_method attr do
        @data[attr]
      end
    end
  end

  def initialize(data)
    @data = data
    data.keys.each { |k| self.class.define_attr(k) }
  end
end
```

上面这段代码有点类似 ActiveRecord 的功能。在 ActiveRecord 中，我们并不需要指定 attribute 但是却可以调用相关的方法，只要数据库对应的表中有相关的 column 即可。

上述代码中，当我们通过 data 来实例化一个 Record 对象时，此时会调用该对象所对应的类的 define_attr 方法，该方法能够为该类定义实例方法。
