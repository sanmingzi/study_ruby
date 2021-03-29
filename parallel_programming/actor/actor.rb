# Actor

## Revactor

[revactor](https://github.com/tarcieri/revactor)

## Dramatis

[dramatis](https://github.com/dramatis/dramatis)

## TODO

上面提到的这两个 gem 似乎都已经废弃了。revactor 在 github 上已经明确指出 broken 了，dramatis 最近的更新是 2018 年。

actor 有点类似 process 的感觉。这个的好处就在于可以避免资源同步的问题，缺点就是 actor 之间的通讯需要的时间。

Matz 提到说 Erlang 几乎全部是面向 actor 来进行编码的，有时间的话可以看看 Erlang 。

ruby 中类似进程的东西应该是 fiber ，有时间应该去看看，毕竟使用进程能很大程度提高 ruby 对多核的利用率。TODO
