# Speed Up ActiveRecord

[speed-up-activerecord](https://blog.codeship.com/speed-up-activerecord/)

## N+1 query problem

You’ll run into this problem when you loop over a list of objects and try to query their associations.

```ruby
class Role < ActiveRecord::Base
  has_many :role_permissions
  has_many :permissions, :through => :role_permissions
end
```

The next code will cause the N+1 query.

```ruby
Role.all.each do |role|
  puts role.permissions.inspect
end
```

We can fix it only use the includes, the next code only access db one time.

```ruby
Role.includes(:permissions).each do |role|
  puts role.inspect
end
```

## Again, N+1 query problem

```ruby
class Role < ActiveRecord::Base
  has_many :role_permissions
  has_many :permissions, :through => :role_permissions
end

def print_role_permissions(role)
  role.role_permissions.each do |role_permission|
    puts role_permission.permission.inspect
  end
end
```

The next code use ```includes```, but it also has N+1 query.

```ruby
role = Role.includes(:role_permissions, :permissions).first
print_role_permissions(role)
```

When there are relationship between the included objects, we should use ```=>```. The next code can void N+1 query problem.

```ruby
role = Role.includes(:role_permissions => :permissions).first
print_role_permissions(role)
```

## preload

## eager load
