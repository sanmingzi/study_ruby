class Developer
  def work
    @person = 'Developer'
    puts 'I am coding'
  end
end

d = Developer.new
puts d.class # Developer
puts d.class.instance_methods(false) # work
puts d.respond_to? :work # true
d.work # I am coding
puts d.instance_variables # @person
