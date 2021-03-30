# ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]

class TestObject
end

[1, '1'.to_sym, TestObject].each do |ele|
  begin
    ele.custom_test
  rescue => exception
    puts exception.message
  end

  ele.class.class_eval do
    def custom_test
      puts "custom_test for #{self.class}:#{self}"
    end
  end
  ele.custom_test
end
