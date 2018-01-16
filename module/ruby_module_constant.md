# Ruby module constant

## const_get && constants

```ruby
module Animal
  class Dog
    VAL = 10

    def eat
      puts "Dog is eating"
    end
  end
end

puts Animal.constants
puts Animal::Dog.constants

Animal.const_get(:Dog).new.eat
puts Animal.const_get('Dog::VAL')

Animal.constants.each do |c|
  Animal.const_get(c).new.eat
end
```
