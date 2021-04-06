module Test
  @module_var = 1
  class << self
    def say
      puts "@module_var = #{@module_var}"
    end
  end

  class Test
    @class_var = 2
    class << self
      def say
        puts "@class_var = #{@class_var}"
      end
    end

    def initialize
      @instance_var = 3
    end

    def say
      puts "@instance_var = #{@instance_var}"
    end
  end
end

Test.say
Test::Test.say
Test::Test.new.say
