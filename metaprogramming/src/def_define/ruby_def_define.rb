class Developer
  def two
    puts "#{self.inspect} two"
  end

  define_method 'one' do
    puts "#{self.inspect} one"
  end
end

developer = Developer.new
developer.one
developer.two
#<Developer:0x0000557a1d0a45a0> one
#<Developer:0x0000557a1d0a45a0> two

Developer.class_eval do
  def two
    puts "#{self.inspect} inside class_eval two"
  end

  define_method 'one' do
    puts "#{self.inspect} inside class_eval one"
  end
end

developer.one
developer.two
#<Developer:0x0000557a1d0a45a0> inside class_eval one
#<Developer:0x0000557a1d0a45a0> inside class_eval two

Developer.instance_eval do
  def two
    puts "#{self.inspect} inside instance_eval two"
  end

  define_method 'one' do
    puts "#{self.inspect} inside instance_eval one"
  end
end

developer.one
Developer.two
# <Developer:0x0000557a1d0a45a0> inside instance_eval one
# Developer inside instance_eval two

class << Developer
  def two
    puts "#{self.inspect} using class << Developer two"
  end

  define_method 'one' do
    puts "#{self.inspect} using class << Developer one"
  end
end

Developer.one
Developer.two
# Developer using class << Developer one
# Developer using class << Developer two

Developer.define_method :test do
  puts "Developer.test"
end
developer.test
# Developer.test

developer.singleton_class.define_method :test do
  puts 'developer.singleton_class.test'
end
developer.test
# developer.singleton_class.test

def developer.test
  puts 'def developer.test'
end
developer.test
# def developer.test

# developer.define_method :test do
#   puts 'developer.test'
# end
# developer.test
