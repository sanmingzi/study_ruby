# Rubygems & Bundler

## What's rubygems

Rubygems is package management framework for Ruby.

## Install/Update/Demote rubygems

- Install
  1. [Download](http://blog.rubygems.org/)
  2. Unpack into a directory and cd there
  3. Install with: ruby setup.rb (you may need admin/root privilege)

- Update

```
gem install rubygems-update -v 2.6.11
update_rubygems _2.6.11_
```

## What's bundler

Bundler is a ruby gem, which dependency to ruby and rubygems.
We use bundler to solve the dependency between other gems.

## Install/Update bundler

`gem install bundler -v '1.15.1'`

## Usage

`bundle install --path vendor/bundle`

When use bundler to install gems, we can specified the installing path .

`bundle exec ruby script.rb`

When we run the ruby code, we can add `bundle exec` before it to specified the gems version be used.

## Conclusion

- `rubygems` is a package, working for ruby to manage gems
- `bundler` is a gem, to solve the dependency between other gems

## Reference

- https://rubygems.org/pages/download
- http://blog.rubygems.org