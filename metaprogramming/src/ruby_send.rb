class Developer
  def work(company)
    puts "I am working for #{company}"
  end

  private

  def coding(company)
    puts "I am coding for #{company}"
  end
end

d = Developer.new
d.send(:work, 'apple')
d.send(:coding, 'apple')
