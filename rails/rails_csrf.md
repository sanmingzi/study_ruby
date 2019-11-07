# Rails CSRF

- [深入 Rails 中的 CSRF Protection](https://ruby-china.org/topics/35199?page=2)
- [ignore the authenticity token](https://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails)

跨站请求伪造(Cros Site Request Forgery)。一个未认证的用户伪造了一个数据请求，并且发到了服务器，让服务器以为这个请求来自一个已认证用户。Rails会生成一个token，每次请求的时候收到客户端请求的时候都会请求身份验证，以避免收到CSRF攻击。

## 如何使用

```ruby
# application_controller.rb
protect_from_forgery with: :exception

# application.html.erb
<%= csrf_meta_tags %>
```

## 生成和加密

```csrf_meta_tags```是一个helper方法，该方法会生成一个加密的CSRF token，存入session中，并且将该token插入到HTML中。

## 解析和验证

当用户在站点提交一个表单时，CSRF token会与表单数据一起提交(默认名为authenticity_token的参数)，也可以将它放在HTTP头X-CSRF-Token中发送。

```protect_from_forgery```方法会为每一个controller action添加一个before_action:

```ruby
before_action :verify_authenticity_token, options
```

```verify_authenticity_token```会将请求中的CSRF token与session存在的token进行匹配验证。

## 跳过 authenticity

```ruby
skip_before_action :verify_authenticity_token, except: [:create, :update, :destroy]
```
