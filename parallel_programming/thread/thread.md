# 线程 Thread

## 基本使用

```ruby
Thread.new {} # 新建 thread，会立即执行
thread.join # 等待该线程执行结束
```

## 多线程带来的问题

- 资源同步问题

[resource_out_sync.rb](src/resource_out_sync.rb)

我在上述的代码中给出一个 ruby 非线程安全的例子。即使在有 GIL 的 MRI 中也无法保证所有的 ruby 代码是线程安全的。

关于 GIL 的部分可以参考 [benchmark.md](../../benchmark/benchmark.md) 。

## 锁

```ruby
mutex = Mutex.new
mutex.synchronize {
# ...
}
```

在 ruby 中我们通过 Mutex 可以实现对资源的独占。想要执行 block 中的内容就需要先获得 mutex 。

## 死锁

锁中锁的情况下是非常容易出现死锁的。

[deadlock.rb](src/deadlock.rb)

## 二阶段互斥

为了说明这个概念，我想引用《松本行弘的程式世界》中的场景。假如有很多人在看电视，看电视和换频道就相当于二阶段互斥。有人在看电视的时候，其他人只能看同一个频道。如果没有互斥的话，看到一半被别人换台是一件非常讨厌的事情。

我们可以使用 Sync / Mutex 来实现二阶段互斥。书中介绍似乎 Sync 处理二阶段互斥问题更加好用，具体如何有待学习。TODO

```ruby
@sync = Sync.new

def start_watch
  @sync.locl(:SH)
end

def end_watch
  @sync.unlock(:SH)
end

def switch
  @sync.synchronize(:EX) {}
end
```

```ruby
@mutex = Mutex.new

def start_watch
  @mutex.locl
end

def end_watch
  @mutex.unlock
end

def switch
  @mutex.synchronize {}
end
```

[tv.rb](src/tv.rb)

## 队列

ruby 中的 Queue 和 Array 有很大的不同。在 Queue 和 Array 都为空的情况下，Array.new.pop 会返回 nil，而 Queue.new.pop 会一直等待，直到出现数据为止。

[queue.rb](src/queue.rb)

## 锁定模型 vs 队列模型
