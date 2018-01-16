# Ruby delegate

## Usage

```ruby
class Greeter < ActiveRecord::Base
  def hello
    'hello'
  end

  def goodbye
    'goodbye'
  end
end

class Foo < ActiveRecord::Base
  belongs_to :greeter
  delegate :hello, :goodbye, to: :greeter
end
```

## Delegate to other object

```ruby
class Foo
  CONSTANT_ARRAY = [0,1,2,3]
  @@class_array  = [4,5,6,7]

  def initialize
    @instance_array = [8,9,10,11]
  end
  delegate :sum, to: :CONSTANT_ARRAY
  delegate :min, to: :@@class_array
  delegate :max, to: :@instance_array
end
```

## Delegate to class

```ruby
class Foo
  def self.hello
    "world"
  end

  delegate :hello, to: :class
end
```

## Options

- prefix

```ruby
Person = Struct.new(:name, :address)

class Invoice < Struct.new(:client)
  delegate :name, :address, to: :client, prefix: true
end

john_doe = Person.new('John Doe', 'Vimmersvej 13')
invoice = Invoice.new(john_doe)
invoice.client_name    # => "John Doe"
invoice.client_address # => "Vimmersvej 13"
```

- custome prefix

```ruby
class Invoice < Struct.new(:client)
  delegate :name, :address, to: :client, prefix: :customer
end

invoice = Invoice.new(john_doe)
invoice.customer_name    # => 'John Doe'
invoice.customer_address # => 'Vimmersvej 13'
```

- allow_nil

```ruby
class User < ActiveRecord::Base
  has_one :profile
  delegate :age, to: :profile
end

User.new.age # raises NoMethodError: undefined method `age'
```

If the delegated object is nil, Use allow_nil can avoid the Exception and it will return nil.

```ruby
class User < ActiveRecord::Base
  has_one :profile
  delegate :age, to: :profile, allow_nil: true
end

User.new.age # nil
```

## Refence

- https://apidock.com/rails/Module/delegate
- https://simonecarletti.com/blog/2009/12/inside-ruby-on-rails-delegate/
- https://blog.lelonek.me/how-to-delegate-methods-in-ruby-a7a71b077d99
