$global_var = 1

module Test
  puts "in module, $global_var = #{$global_var}"
  class Test
    puts "in class, $global_var = #{$global_var}"
    def test
      puts "in method, $global_var = #{$global_var}"
    end
  end
end

Test::Test.new.test
