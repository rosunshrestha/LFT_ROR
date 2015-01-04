module CompleteName
  attr_accessor :name,:s_name

  def complete_name
    puts @name + " " +@s_name
  end
end


class Animal
  attr_accessor :attr_name
  include CompleteName
  def initialize name
    @name = name

  end
end


class Human
  attr_accessor :f_name,:l_name
  include CompleteName
  def initialize f_name, l_name
    @name = f_name + " " +l_name
  end
end

a = Animal.new 'Frog'
h = Human.new 'Joe', 'Doe'
a.s_name = "Rana Togrina"
h.s_name = "Homo Sapiens"
a.complete_name
h.complete_name
