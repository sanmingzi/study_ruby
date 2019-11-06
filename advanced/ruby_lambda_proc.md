# Ruby lambda proc

## Lambda

```ruby
l = lambda { "Do or do not" }
l.call

l = lambda { |str| "Do or do not #{str}" }
l.call('something')

l = lambda do |str|
  if str == 'try'
    return 'There is no such thing'
  else
    return 'Do or do not'
  end
end
l.call('try')
```

## Proc

```ruby
def gen_times(factor)
  return Proc.new { |n| n * factor }
end
times3 = gen_times(3)
times5 = gen_times(5)

times3.call(12)               #=> 36
times5.call(5)                #=> 25
times3.call(times5.call(4))   #=> 60
```

## Proc vs Lambda

- Proc and Lambda are both Proc objects.

```ruby
proc = Proc.new { puts "Hello world" }
lam = lambda { puts "Hello World" }

proc.class # returns 'Proc'
lam.class  # returns 'Proc'
```

- Lambda check the number of arguments, while Proc not

```ruby
lam = lambda { |x| puts x }    # creates a lambda that takes 1 argument
lam.call(2)                    # prints out 2
lam.call                       # ArgumentError: wrong number of arguments (0 for 1)
lam.call(1,2,3)                # ArgumentError: wrong number of arguments (3 for 1)
```

```ruby
proc = Proc.new { |x| puts x } # creates a proc that takes 1 argument
proc.call(2)                   # prints out 2
proc.call                      # returns nil
proc.call(1,2,3)               # prints out 1 and forgets about the extra arguments
```

- Lambda and Proc treat the 'return' keyword different

`return` inside of a lambda triggers the code right outside of the lambda code

```ruby
def lambda_test
  lam = lambda { return }
  lam.call
  puts "Hello world"
end

lambda_test                 # calling lambda_test prints 'Hello World'
```

`return` inside of a proc triggers the code right outside of the method where the proc is being executed

```ruby
def proc_test
  proc = Proc.new { return }
  proc.call
  puts "Hello world"
end

proc_test                 # calling proc_test prints nothing
```

## Closure

```ruby
# Example of Proc objects preserving local context

def counter
  n = 0
  return Proc.new { n += 1 }
end

a = counter
a.call            # returns 1
a.call            # returns 2

b = counter
b.call            # returns 1

a.call            # returns 3
```

## Conclusion

- Lambda check the number of argument, while Proc not
- Lambda and Proc treat the 'return' keyword differently
- We should use the lambda at most time, just a no-name method. It is the best way to use Proc.

## Reference

- http://awaxman11.github.io/blog/2013/08/05/what-is-the-difference-between-a-block/
