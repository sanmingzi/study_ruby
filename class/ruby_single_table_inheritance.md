# Ruby single table inheritance

## Usage

```
class Boy < User; end

class Girl < User; end

class User < ActiveRecord::Base
  def self.inherited(child)
    child.instance_eval do
        def model_name
          User.model_name
        end
    end
    super
  end
end
```

![](/assets/single_talbe_inheritance.PNG)

When we use single table inheritance, all attributes of all child class will be record in one table, so this table is redundancy.
When the child classes is similar, we can use single talbe inheritance for free.

## Reference

- http://www.martinfowler.com/eaaCatalog/singleTableInheritance.html
http://michael-roshen.iteye.com/blog/2119766/