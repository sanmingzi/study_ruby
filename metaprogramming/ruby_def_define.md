# Ruby Def Define

## References

[Ruby define_method def 的区别](https://www.iteye.com/blog/piecehealth-1966047)

## 定义方法

在 ruby 中我们使用 def 和 define_method 来定义方法。

[ruby_def_define.rb](src/def_define/ruby_def_define.rb)

在上述代码中，我们分别在 4 种情况下使用 def / define_method 来定义方法。

- class Developer / Developer.class_eval

在这两种情况下，使用 def / define_method 没有区别，都是为 Developer 定义了 instance method 。

- class << Developer

在这种情况下，使用 def / define_method 没有区别，都是为 Developer 定义了 class method 。

因为这种情况下，是打开了 Developer 对应的 metaclass，使用 def / define_method 都是往 metaclass 添加了方法，所以没有区别。

- Developer.instance_eval

在这种情况下，使用 def 会为 Developer 定义一个类方法，使用 define_method 会为 Developer 定义一个实例方法。

这种情况比较特殊，首先使用 instance_eval 时，其 self 并不是 metaclass ，而是 Developer 本身。此时，我们使用 define_method 相当于在 Developer 内部调用该方法，所以会为 Developer 添加一个 instance method 。而使用 def 会为 Developer 添加一个 class method 。

## 效率

def 是 ruby 中为数不多的关键字，而 define_method 是一个能够定义新方法的方法，所以 def 会比 define_method 更快。如果能够同时使用 def 和 define_method ，还是使用 def 效率更高。

## Context

[ruby_def_define_context.rb](src/def_define/ruby_def_define_context.rb)

def 中的代码是跟上下文完全隔离的（只能够识别 @ $ 变量），而 define_method 能够读取不带任何修饰的变量。正是由于 define_method 的这个特性，我们能够很方便的动态生成方法。

[company.rb](src/def_define/company.rb)

在上述代码中，每当 Company 发布一个新产品，我们将自动创建一个产品类，并且该产品类会自动关联到其对应的公司，非常的方便。

## Receiver

在 instance_eval 中使用 def / define_method 得到的结果是完全不同的，分别创建的是 class method / instance method 。这说明 def / define_method 创建的方法的 receiver 是有区别的。

大致感觉是，def 有一定的延迟性，而 define_method 的 receiver 就是当前 self 。在 instance_eval 中，self 实际上是类本身，所以使用 define_method 创建了 instance method。而 def 的 receiver 被修改成了 self.singleton_class ，所以 def 创建的是 class method 。
