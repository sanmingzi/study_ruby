# Ruby tap

## Usage

- Assigning a property to an object

```ruby
# TRADITIONAL
object = SomeClass.new
object.key = 'value'
object

# TAPPED
object = SomeClass.new.tap do |obj|
  obj.key = 'value'
end

# CONDENSED
obj = SomeClass.new.tap { |obj| obj.key = 'value' }
```

- Ignoring method return

```ruby
# TRADITIONAL
object = Model.new
object.save!
object

# TAPPED
object = Model.new.tap do |model|
  model.save!
end

# CONDENSED
object = Model.new.tap(&:save!)
```

- Using in-place operations chained

```ruby
# TRADITIONAL
arr = [1, 2, 3]
arr.reverse!
arr

# TAPPED CONDENSED
[1, 2, 3].tap(&:reverse!)
```

## Reference

- http://seejohncode.com/2012/01/02/ruby-tap-that/
