# Ruby environment variable

## Usage

We can only use the export environment variables in ruby ENV.

We can use "set -a" to source a key-value profile.

```ruby
# profile.env
NAME=zhiming

# linux
set -a

# irb
source profile.env
puts ENV["NAME"]
# => zhiming
```

## Reference

- http://stackoverflow.com/questions/18029470/reading-in-variables-from-a-file-in-ruby