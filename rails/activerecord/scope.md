# Ruby Rails Scope

## Use block

- bad

```ruby
class Post < ActiveRecord::Base
  scope :published_last_week, where('published_at >= ?', 1.week.ago)
end
```

- good

```ruby
class Post < ActiveRecord::Base
  scope :published_last_week, -> { where('published_at >= ?', 1.week.ago) }
end
```

The main difference between both usages is that `bad` is evaluated when the class is first loaded, it is not expected. We hope `1.week.ago` from current time, not the class first loaded.

## Parameter

```ruby
class Post < ActiveRecord::Base
  scope :by_status, -> (status) { where('status>= ?', status) }
end

```

## Extensible

## Merge

```ruby
class Subscription
  scope :active, -> { where(active: true) }
end

class User < ActiveRecord::Base
  has_one :subscription
  scope :with_active_subscription, -> { joins(:subscription).merge(Subscription.active) }
end
```

I think it is so useful to use scope in association models.

## Conclusion

- `scope` define a class method
- use block in `scope`
- `scope` is extensible
- merge two `scope` even in association models.

## Reference

- http://blog.plataformatec.com.br/2013/02/active-record-scopes-vs-class-methods/
- http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html