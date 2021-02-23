class Cat
  word = 'miao'

  define_method :say_word do
    puts "word of Cat is #{word}"
  end
end

class Dog
  word = 'wang'

  def say_word
    puts "word of Dog is #{word}"
  end
end

Cat.new.say_word
# word of Cat is miao

Dog.new.say_word
# undefined local variable or method `word'
