# Ruby Collect Map

## Usage

- collect / map 没有区别，我更倾向于使用 collect，因为 map 在很多地方是关键字
- collect / map 不会改变原数组
- 我们可以通过使用 collect / map 让 Hash 生成新的数组
- Array可以通过使用 collect! 和 map! 来改变原数组，但是 Hash 是不可以的

```ruby
arr = [1, 2, 3]
arr.collect { |ele| ele + 1 }
arr.map { |ele| ele + 1 }
# => [2, 3, 4]

arr.collect! { |ele| ele + 1 }
arr
# => [2, 3, 4]

hash = {'a' => 1, 'b' => 2}
hash.collect { |key, value| [key, value] }
hash.map { |key, value| [key, value] }
# => [["a", 1], ["b", 2]]

hash.map! { |key, value| [key, value] }
# NoMethodError (undefined method `map!' for {"a"=>1, "b"=>2}:Hash)
```
