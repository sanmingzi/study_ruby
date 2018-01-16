# Ruby class attribute

## attr_accessor

```ruby
class Person
  attr_accessor :name
end
```

The above code is equal to:

```ruby
class Person
  def name
    @name
  end
  
  def name=(str)
    @name = str
  end
end
```
    
## attr_reader attr_writer

```ruby
class Person
  attr_reader :name
  attr_writer: name
end
```

## cattr_accessor

```ruby
class Person
  cattr_accessor :count
end
```
    
The above code is equal to:

```ruby
class Person
  def count
    @@count
  end
  
  def count=(count)
    @@count = count
  end
end
```

## Conclusion

- When we use instance variable in instance method, it is better to use such as '@name'.
- Such as '@name' is private, we can not direct access it and we should use some public methods.

## Reference

- http://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby
