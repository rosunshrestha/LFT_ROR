class Shape
	def area()
		puts 'No area for shape available'
	end
end


class Circle < Shape
	PI = 3.14
	attr_accessor :radius
	def initialize(r)
		@radius = r
	end
	
	def area()
		a = (PI * radius ** 2).to_f
		puts "The Area of circle is #{a}" 
	end
	
end

class Rectangle < Shape
	attr_accessor :length, :breadth
	def initialize(l,b)
		@length = l
		@breadth = b
	end
	def area()
		a = length * breadth
		puts "The Area of rectangle is #{a}" 
	end
end

r = Rectangle.new 4,5
c = Circle.new 6
r.area
c.area
 
