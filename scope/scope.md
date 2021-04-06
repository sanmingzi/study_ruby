# 作用域 (scope)

作用域表示能够访问到变量的区域。根据变量类型不同，可以分为全局变量作用域、实例变量作用域、局部变量作用域。

## 全局变量作用域

[global_scope.rb](global_scope.rb)

```ruby
$global_var = 1

module Test
  puts "in module, $global_var = #{$global_var}"
  class Test
    puts "in class, $global_var = #{$global_var}"
    def test
      puts "in method, $global_var = #{$global_var}"
    end
  end
end

Test::Test.new.test
```

全局变量可以在任何地方进行访问，不受 module / class / def 等限制。

## 实例变量作用域

[instance_scope.rb](instance_scope.rb)

```ruby
module Test
  @module_var = 1
  class << self
    def say
      puts "@module_var = #{@module_var}"
    end
  end

  class Test
    @class_var = 2
    class << self
      def say
        puts "@class_var = #{@class_var}"
      end
    end

    def initialize
      @instance_var = 3
    end

    def say
      puts "@instance_var = #{@instance_var}"
    end
  end
end

Test.say
Test::Test.say
Test::Test.new.say
```

ruby 中一切皆是对象，包括 module / class 。对象的实例变量在对象内部是共享的，该对象的方法都能够访问到这些实例变量。

## 局部变量作用域

[local_scope.rb](local_scope.rb)

```ruby
out_local_var = 1

module TestModule
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 1
  puts in_local_var
end

class TestClass
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 2
  puts in_local_var
end

def test
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 3
  puts in_local_var
end
test
```

局部变量的作用域会被 module / class / def 这 3 个作用域门隔开，每个作用域都是完全独立的，def 中是无法访问 def 外部的变量的。这点和很多语言不同，C++ / Java 等内部作用域可以看到外部作用域的变量。ruby 中是没有作用域嵌套的说法的，当我们进入 module / class / def 就会进入一个全新的作用域，而之前作用域的局部变量全部无法访问。
