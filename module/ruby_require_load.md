# Ruby require load

- [Ruby中的require、load、autoload](https://www.cnblogs.com/evallife/p/3917610.html)
- [ruby中require和load的区别](https://blog.csdn.net/feigeswjtu/article/details/51176626)


## load(filename, wrap = false) -> true / raise LoadError

- filename可以是绝对路径也可以是相对路径，Ruby不会为filename添加扩展名
- 如果是绝对路径，则会查找该文件
- 如果是相对路径，会在$LOAD_PATH目录中搜索该文件
- load不会跟踪要导入的库是否已经被加载，会重复加载文件并且执行

## require(name) -> true / false / raise LoadError

- name可以是绝对路径也可以是相对路径，Ruby会为name补充扩展名
- 如果是绝对路径，会查找该文件
- 如果是相对路径，会在$LOAD_PATH目录中搜索该文件
- 找到该文件后，会运行该文件，并将文件的绝对路径加入全局变量中，保证不重复加载
- 第一次加载返回true，已经加载返回false，找不到文件raise LoadError

## autoload(module, filename) -> nil / raise LoadError

- 将filename与module关联，第一次使用module时，使用require加载该文件
- 执行过程和require一样
- 成功返回nil

## load vs require vs autoload

- load会重复加载，需要指定扩展名
- require能避免重复加载，无需指定扩展名
- autoload会在需要时使用require加载
- 如果一个library的状态会频繁变化，我们使用load加载，获取最新的状态
- autoload使用的是懒加载，只有在用到这个模块的时候才会去加载

个人认为，autoload可以加快ruby程序的初始化阶段，通过懒加载，可以加快初始化的速度。另外，如果用户不使用某些功能，则可能不需要加载代码的某些部分，可以减少加载时间并减少内存占用。  
据网上资料称，autoload并非线程安全的。如果你的ruby程序对于内存并无过多限制，那么使用require在初始化的时候一次性预加载所有代码，是我认为比较合理的方式。

## LOAD_PATH

```ruby
$LOAD_PATH # => array of path
$:         # => $LOAD_PATH
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$:.unshift(File.expand_path(File.dirname(__FILE__)))
$: << File.expand_path(File.dirname(__FILE__))
```
