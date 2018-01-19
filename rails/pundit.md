# Ruby Rails Pundit

## Pundit Base

```ruby
ApplicationController < ActionController::Base
  # current_user is come from devise
  alias_method :pundit_user, :current_user
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
class PostController < ApplicationController
  include Pundit

  def index
    @posts = policy_scope(Post)
  end
end

class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    end
  end
end
```

`policy_scope(Post)` is equal to `PostPolicy::Scope.new(current_user, Post).resolve`

## Authorization

```ruby
class PostPolicy < ApplicationPolicy
  def update?
    user.admin? || !record.published?
  end
end

class PostController < ApplicationController
  include Pundit

  def update
    @post = Post.find(params[:id])
    authorize @post # or authorize @post, :update?
  end
end
```

## Reference
