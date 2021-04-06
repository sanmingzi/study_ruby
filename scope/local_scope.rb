out_local_var = 1

module TestModule
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 1
  puts in_local_var
end

class TestClass
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 2
  puts in_local_var
end

def test
  begin
    puts out_local_var
  rescue => exception
    puts exception.message
  end
  in_local_var = 3
  puts in_local_var
end
test
