# Ruby shallow deep copy

## Shallow copy

- =

```ruby
Person = Struct.new(:name)

zhiming = Person.new("zhiming")

zhiming_copy = zhiming
puts zhiming.object_id == zhiming_copy.object_id # => true

zhiming_copy.name = 'chiming'
puts zhiming.name # => chiming
```

- clone & dup

```ruby
Person = Struct.new(:name)

[:clone, :dup].each do |copy|
  zhiming = Person.new("zhiming")
  zhiming_copy = zhiming.send(copy)
  puts zhiming.object_id == zhiming_copy.object_id # => false
  puts zhiming.name.object_id == zhiming_copy.name.object_id # => true

  zhiming_copy.name[0] = 'c'
  puts zhiming.name # => chiming

  zhiming_copy.name = 'xyz'
  puts zhiming.name # => chiming
end
```

Because `zhiming.name == zhiming_copy.name`, we use `zhiming_copy.name[0] = 'c'`, just like `zhiming.name[0] = 'c'`, so the result is `chiming`.

But when we use `zhiming_copy.name = 'xyz'`, it make `zhiming_copy.name` reference to other object and do not affect `zhiming.name`, so the result not change.

## Deep copy

```ruby
class Person
  attr_accessor :name, :child

  def initialize(name)
    @name = name
  end
end

child = Person.new("child")
zhiming = Person.new("zhiming")
zhiming.child = child

zhiming_copy = Marshal.load(Marshal.dump(zhiming))

['name', 'child', 'child.name'].each do |obj|
  puts eval("zhiming.#{obj}.object_id == zhiming_copy.#{obj}.object_id") # => false
end

zhiming_copy.name[0] = 'c'
puts zhiming.name # => zhiming

zhiming_copy.name = 'xyz'
puts zhiming.name # => zhiming

zhiming_copy.child.name[0] = 'x'
puts zhiming.child.name # => child

zhiming_copy.child.name = 'xyz'
puts zhiming.child.name # => 'child'
```

The `Marshal.load` is the really deep copy, it not only copy the object itself, but also the attributes and reference of the object.

## Conclusion

- `=/copy/dup` are both shallow copy
- `=`, the copy object is equal the origin object
- `copy/dup`, only copy the object itself, but not attributes.
- `Marshal.load`, the only really deep copy

## Reference

- https://ruby-china.org/topics/22164
