def find(*args)
  puts args.inspect
end

find(1)
find([1])
find(1, 2, 3)
find(name: :test)
find(name: :test, age: 10)
find({name: :test, age: 10})
find('ceeeeeeeeeeeeeeb', name: :test, age: 10)
find({name: :test}, 'ceeeeeeeeeeeeeeb', {age: 10})
