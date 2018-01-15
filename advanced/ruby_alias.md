# Ruby alias

## Usage

```
class User
  def full_name
    puts "Johnnie Walker"
  end

  alias name full_name
end

class User
  def full_name
    puts "Johnnie Walker"
  end

  alias_method :name, :full_name
end
```

In case of `alias_method`, we need to use a comma between the "new method name" and "old method name".

## Difference betwen alias and alias_method

```
class Foo
  def hello
    puts "Hello from Foo"
  end

  def self.add_alias
    alias hello2 hello
    alias_method :hello3, :hello
  end
end

Foo.add_alias
Foo.new.hello  # => puts "Hello from Foo"
Foo.new.hello2 # => puts "Hello from Foo"
Foo.new.hello3 # => puts "Hello from Foo"

class Bar < Foo
  def hello
    puts "Hello from Bar"
  end
end

Bar.add_alias
Bar.new.hello  # => puts "Hello from Bar"
Bar.new.hello2 # => puts "Hello from Foo"
Bar.new.hello3 # => puts "Hello from Bar"
```

`alias` is a keyword and it is lexically scoped. It treat `self` as the value of `self` at the time the source code was read.
In contrast `alias_method` treats `self` as the value determined at the run time.

## Conclusion

Use alias_method, because it is more flexible.

## Reference

https://blog.bigbinary.com/2012/01/08/alias-vs-alias-method.html
