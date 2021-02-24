class Developer
  def work
    puts 'Developer work'
  end
end

class SeniorDeveloper < Developer
  def work
    puts 'SeniorDeveloper work'
  end
end

sd = SeniorDeveloper.new
sd.work # SeniorDeveloper work

class SeniorDeveloper
  remove_method :work
end
sd.work # Developer work

class SeniorDeveloper
  undef_method :work
end

begin
  sd.work
rescue => exception
  puts exception.inspect # undefined method
end

class SeniorDeveloper
  def work
    puts 'SeniorDeveloper work'
  end
end
sd.work # SeniorDeveloper work
