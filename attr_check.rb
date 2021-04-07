module AttrCheck
  class << self
    def included(base)
      base.extend ClassMethods
    end
  end

  module ClassMethods
    check_blocks = Hash.new([])
    attr_checkeds = Hash.new(false)

    define_method :attr_check do |name, options = {}, &block|
      options[:block] = block
      check_blocks[name] << options

      if attr_checkeds[name] == false
        alias_method "origin_set_#{name}", "#{name}="

        define_method("#{name}=") do |v|
          checks = check_blocks[name]
          for i in 0...checks.length
            if false == checks[i][:block].call(v)
              puts checks[i][:message]
              return
            end
          end
          self.send "origin_set_#{name}", v
        end
      end

      attr_checkeds[name] = true
    end
  end
end

class MyClass
  include AttrCheck

  attr_accessor :age

  attr_check :age, message: 'age should big than 10' do |v|
    v > 10
  end
  attr_check :age, message: 'age should small than 101' do |v|
    v < 101
  end
end

obj = MyClass.new
[0, 10, 100, 200].each do |v|
  begin
    obj.age = v
    puts obj.inspect
  rescue => exception
    # puts exception.inspect
  end
end
