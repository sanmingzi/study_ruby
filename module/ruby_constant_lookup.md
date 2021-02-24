# Ruby Constant Lookup

常量，大写字母开头，最好是全部大写。

不能在方法中定义常量，只能在 Module (Class < Module) 中定义常量。

常量的查找一般通过下面两种途径：

- Module.nesting
- if can not find the constant, then find it in self.ancestors

详情可参考代码 [ruby_constant_lookup.rb](src/ruby_constant_lookup.rb)

如果我们是在定义的方法中使用 Constant ，那么此时 self.ancestors 中的 self 并不是方法内部的 self ，而应该是方法外面的 self 。参考代码 [ruby_constant_self.rb](src/ruby_constant_self.rb)

这也很好的解释了使用 include / extend 添加 module 中的 constant 时，使用 self.method_name 和 class << self 会造成对 constant 的访问权限不一致的情况。
