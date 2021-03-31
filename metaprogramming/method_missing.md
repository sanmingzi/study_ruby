# 幽灵方法 (Method Missing)

[record.rb](src/method_missing/record.rb)

[method_missing.rb](src/method_missing/method_missing.rb)

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
  end

  def attributes
    @data.keys
  end

  def method_missing(method, *args)
    if attributes.include?(method)
      attributes.each do |attr|
        self.class.define_method attr do
          @data[attr]
        end
      end
      send(method)
    else
      super
    end
  end

  def respond_to?(method)
    attributes.include?(method) || super
  end
end
```

上面这段代码最关键的部分就在于覆写了 method_missing 。当出现 method_missing 的时候，我们会先判断该方法是否为 @data 的属性，如果是的话，我们遍历 @data 的所有属性并且为该对象的类添加相应的方法。

这个做法和 [动态方法](dynamic_method.md) 中的效果是类似的，只是 define_method 的时机不同。在 ActiveRecord 中，使用的就是类似上述的 method_missing 。

下面这个例子是 XmlBuilder ，同样是使用 method_missing 能够将不同的 tag 最后都转换为 xml 。

[xml_builder.rb](src/method_missing/xml_builder.rb)

```ruby
class XmlBuilder
  def build(&block)
    @data = '<xml>'
    block.call if block_given?
    @data += '</xml>'
  end

  def method_missing(name, *args, &block)
    @data += "<#{name}>"
    @data += args[0] if args[0]
    block.call if block_given?
    @data += "</#{name}>"
  end
end
```
