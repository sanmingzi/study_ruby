# Benchmark

- [Benchmark](https://ruby-doc.org/stdlib-2.5.3/libdoc/benchmark/rdoc/Benchmark.html)

benchmark 可以用来计算和报告 ruby code 的执行时间。下面这个例子是一个非常简单的应用。

[benchmark.rb](src/benchmark.rb)

## 全局解释器锁 GIL

[Ruby 无人知晓的 GIL](https://ruby-china.org/topics/28415)

在不同的 ruby 解释器中，表现是不一样的。我用的是官方的解释器 MRI (Matz's Ruby Interpreter) 。在这个解释器中就会用到 GIL (Global Interpreter Lock) 全局解释器锁。每个线程想要运行 ruby 代码的时候，都需要去申请 GIL 。这样就能够保证永远都至于一个 thread 处于活跃状态，从而避免了多线程而引发的资源不同步的问题。

MRI 通过使用 GIL 解决了一些多线程资源同步的问题，但随之而来的是性能上的瓶颈。这种做法导致了 ruby 在多核机器上无法发挥出极致的性能。因为永远都有一把锁悬在线程的头顶，而锁是唯一的，所以永远只有一个线程在进行计算，而无法做到并行运算。
