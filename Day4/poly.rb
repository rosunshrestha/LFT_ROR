class Animal
  def display
    puts 'animal'
  end
end

class Dog
  def display
    puts 'dog'
  end
end

class Cat
  def display
    puts 'cat'
  end
end

a = []
a[0] = Dog.new
a[1] = Cat.new

a[0].display

a[1].display