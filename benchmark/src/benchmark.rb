require 'benchmark'

def collect1(arr)
  arr.collect! { |ele| ele.to_s }
end

def collect2(arr)
  arr.collect!(&:to_s)
end

arr = (1..1000).collect { rand(1000) }

Benchmark.bm do |x|
  3.times {
    x.report { collect1(arr) }
    x.report { collect2(arr) }
  }
end
