# Ruby send eval binding

## Eval

- define

```ruby
def eval(string, *binding_filename_lineno)
end
```

- basic usage

```ruby
str = 'hello'
p eval("str + ' Ruby'") #=> "hello Ruby"
```

- use eval in binding

```ruby
def change(str)
  binding
end
str = 'hello'
p eval("str + ' Ruby'", change('bye')) #=> "bye Ruby"
```

In this case, we run eval in the binding context, also in the change method, so the `str = "bye"`, so the result is `"bye Ruby"`.

## Send

## Reference

- http://blog.csdn.net/happyanger6/article/details/42836387