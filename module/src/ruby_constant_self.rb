module Constant
  NAME = 'Matz'
end

class Developer
  include Constant

  puts self.ancestors.inspect
  # [Developer, Constant, Object, Kernel, BasicObject]

  def self.say
    puts NAME
  end
end
Developer.say

def Developer.say
  puts NAME
end

begin
  Developer.say
rescue => exception
  puts exception.inspect
  # #<NameError: uninitialized constant NAME>
end

class << Developer
  def say
    puts NAME
  end
end

begin
  Developer.say
rescue => exception
  puts exception.inspect
  # #<NameError: uninitialized constant #<Class:Developer>::NAME>
end

class Developer
  def say
    NAME << ' HELLO'
    puts NAME
  end

  def self.say
    puts NAME
  end
end
Developer.new.say # Matz
Developer.say # Matz HELLO
