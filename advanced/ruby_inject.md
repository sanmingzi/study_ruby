# Ruby inject

## Usage

```
@arr = [1, 2, 3]

def sum(init_result = 0)
  @arr.inject(init_result) { |result, v| result + v }
end

p sum
p sum(100)

# 6
# 106

hash = {'a' => 1, 'b' => 2}
p hash.inject([]) { |result, (k, v)| result << [k, v]; result }

arr = [['a', 1], ['b', 2]]
p arr.inject({}) { |result, v| result[v.first] = v.last; result }


# [["a", 1], ["b", 2]]
# {"a"=>1, "b"=>2}
```

## Reference

https://apidock.com/ruby/Enumerable/inject
