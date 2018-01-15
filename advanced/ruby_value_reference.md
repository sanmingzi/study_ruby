# Ruby value reference

## You should know

- ruby一切皆是对象
- object_id可以代表object在memory中的location

## Case 1

```
obj_string = String.new("zhiming")
puts "#{obj_string}.object_id = #{obj_string.object_id}"

def change_string(str)
  puts "begin change_string, #{str}.object_id = #{str.object_id}"
  str = "chiming"
  puts "after change_string, #{str}.object_id = #{str.object_id}"
end
change_string(obj_string)
puts "#{obj_string}.object_id = #{obj_string.object_id}"
```

![](/assets/str_obj_000.png)

![](/assets/str_obj_001.png)

在change_string方法开始的时候，str是指向"zhiming"这个对象的。
接着我们new了一个新的对象String("chiming")，并将str指向这个新的对象，所以str的object_id发生了变化。
函数结束之后，str对象销毁，"chiming"这个对象没有被引用，所以也被销毁。
obj_string这个对象依旧指向"zhiming"。

特别注意：
str = "chiming"
这句code乍看起来是在修改str的值，但是其实并不是这样的。
ruby里面一切皆是对象，所以这句code等同于
str = String.new("chiming")
会将str这个对象指向String.new("chiming")，所以经过这句code之后，str.object_id发生了变化，但是obj_string并未发生改变。

## Case 2

```
obj_string = String.new("zhiming")
puts "#{obj_string}.object_id = #{obj_string.object_id}"

def change_first_char(str)
  puts "begin change_string, #{str}.object_id = #{str.object_id}"
  str[0] = 't'
  puts "after change_string, #{str}.object_id = #{str.object_id}"
end
change_first_char(obj_string)
puts "#{obj_string}.object_id = #{obj_string.object_id}"
```

![](/assets/str_obj_002.png)

![](/assets/str_obj_003.png)

在change_first_char方法中，并没有创建新的对象，str始终都是指向"zhiming"这个对象。
在方法中，通过str修改"zhiming"这个对象的值。
方法结束后，str对象被销毁，但是"zhiming"已经变成了"thiming"。
所以经过该方法之后obj_string = "thiming"

## Conclusion

- ruby中一切皆是对象
- ruby中的参数传递都是传引用
- 对引用赋值其实是将引用指向另外的地址