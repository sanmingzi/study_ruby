# Ruby Rails Pundit

## Pundit Base

```ruby
ApplicationController < ActionController::Base
  # current_system_user is come from devise
  alias_method :pundit_user, :current_system_user
end

class ApplicationPolicy
  attr_reader :user, :record
  
  def initialize(user, record)
    @user = user
    @record = record
  end
end
```

## Scope

```ruby
```

## Authorization

```ruby
class PostPolicy < ApplicationPolicy
  def update?
    user.admin? && record.published?
  end
end

class PostController < ApplicationController
  include Pundit

  def update
    @post = Post.find(params[:id])
    authorize @post
  end
end
```

## Reference
