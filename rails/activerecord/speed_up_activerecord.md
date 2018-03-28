# Speed Up ActiveRecord

https://blog.codeship.com/speed-up-activerecord/

## N+1 query problem

```
class Role < ActiveRecord::Base
  has_many :role_permissions
  has_many :permissions, :through => :role_permissions
end

def print_role_permissions
  role.permissions.each do |permission|
    puts permission.inspect
  end
end
```

The next code will cause the N+1 query.

```
role = Role.first
print_role_permission(role)
```

We can fix it only use the includes, the next code only access db one time.

```
role = Role.includes(:permissions).first
print_role_permission(role)
```

## Again, N+1 query problem

```
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

```
role = Role.includes(:role_permissions, :permissions).first
print_role_permissions(role)
```

When there are relationship between the included objects, we should use ```=>```. The next code can void N+1 query problem.

```
role = Role.includes(:role_permissions => :permissions).first
print_role_permissions(role)
```
