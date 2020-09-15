# Ruby Sort

## Usage

```ruby
arr.sort { |ele0, ele1| block }
# if the block less than 0, that means ele0 < ele1
# if the block equal than 0, that means ele0 = ele1
# if the block greater than 0, that means ele0 > ele1
# this method will sort the array ASC by default
# if two element is equal, the order is unpredictable

arr.sort! { |ele0, ele1| block }
# sort will not change the Array arr
# but sort! will change arr self
```

```ruby
arr.sort_by(&:attribute)
arr.sort_by { |ele| ele.attribute }
arr.sort_by { |ele| [ele.attribute0, ele.attribute1 ... ]}

# sort_by not change arr self, but sort_by! will
# the default sort order is ASC, if you want to sort DESC, you can use like this

arr.sort_by { |ele| -ele.attribute }
```

## sort

```ruby
arr = [[0, 1], [2, 3, 4], [5, 6, 7]]

arr.sort { |ele0, ele1| 0 }
# => [[0, 1], [2, 3, 4], [5, 6, 7]]

arr.sort { |ele0, ele1| -1 }
# => [[0, 1], [2, 3, 4], [5, 6, 7]]

# reverse
arr.sort { |ele0, ele1| 1 }
# => [[5, 6, 7], [2, 3, 4], [0, 1]]

# sort by length ASC
arr.sort { |ele0, ele1| ele0.length <=> ele1.length }
# => [[0, 1], [2, 3, 4], [5, 6, 7]]

# sort by length DESC
arr.sort { |ele0, ele1| ele1.length <=> ele0.length }
# => [[2, 3, 4], [5, 6, 7], [0, 1]]

# sort by the first value
arr.sort { |ele0, ele1| ele1[0] <=> ele0[0] }
# => [[5, 6, 7], [2, 3, 4], [0, 1]]

# sort by multiple values DESC, [ele.length, ele[0]]
arr.sort { |ele0, ele1| [ele1.length, ele1[0]] <=> [ele0.length, ele0[0]] }
# => [[5, 6, 7], [2, 3, 4], [0, 1]]
```

## sort_by

```ruby
arr = [[2, 3, 4], [0, 1], [5, 6, 7]]

arr.sort_by(&:length)
# => [[0, 1], [2, 3, 4], [5, 6, 7]]

arr.sort_by { |ele| ele.length }
# => [[0, 1], [2, 3, 4], [5, 6, 7]]

arr.sort_by { |ele| -ele.length }
# => [[2, 3, 4], [5, 6, 7], [0, 1]]

arr.sort_by { |ele| [-ele.length, -ele[0]] }
# => [[5, 6, 7], [2, 3, 4], [0, 1]]
```

## sort Hash

```ruby
hash = {coconut: 200, orange: 50, bacon: 100}
hash.sort { |ele0, ele1| ele0.last <=> ele1.last }.to_h
hash.sort_by(&:last).to_h
hash.sort_by { |ele| ele.last }.to_h
# => {:orange=>50, :bacon=>100, :coconut=>200}


hash.sort! { |ele0, ele1| ele0.last <=> ele1.last }.to_h
# NoMethodError (undefined method `sort!' for {:coconut=>200, :orange=>50, :bacon=>100}:Hash)
# Attention: there is no method sort! / sort_by! for Hash
```

## Reference

- https://www.rubyguides.com/2017/07/ruby-sort/
