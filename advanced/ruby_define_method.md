# Ruby define_method

## Define instances method

```ruby
class Message
  [:hello, :goodbye].each do |method_name|
    define_method method_name do |arg|
      "#{method_name} #{arg}"
    end
  end
end

#irb
Message.instance_methods false #=> [:hello, :goodbye]
Message.new.hello 'emre' #=> "hello emre"
Message.new.goodbye 'emre' #=> "goodbye emre"
```

## Use singleton method define instances method

```ruby
class Message
  def self.create_instance_methods *methods
    methods.each do |method_name|
      define_method method_name do |arg|
        "#{method_name} #{arg}"
      end
    end
  end
end

#irb
Message.singleton_methods #=> [:create_instance_methods]
Message.create_instance_methods 'follow' #=> ["follow"]
Message.instance_methods false #=> [:follow]
Message.new.follow 'emre' #=> "follow emre"
```

## Define singleton method

```ruby
class Message
  def self.create_singleton_methods *methods
    methods.each do |method_name|
      singleton_class.send :define_method, method_name do |arg|
        "#{method_name} #{arg}"
      end
    end
  end
end

#irb
Message.singleton_methods false #=> [:create_singleton_methods]
Message.create_singleton_methods 'like' #=> ["like"]
Message.singleton_methods false #=> [:create_singleton_methods, :like]
Message.like 'emre' #=> "like emre"
```

## Reference

- http://railstic.com/2011/06/dynamically-defining-methods-with-define_method

