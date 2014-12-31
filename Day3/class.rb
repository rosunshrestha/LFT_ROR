class Box
	BOX_CONSTANT = 'HELLO'
	@@global_value = 0
	attr_accessor :width, :height
	def initialize(w,h)
		@width = w
		@height = h
	end
	def self.get_global
		@global_value
	end
	
	def width=(val)
		@width = val
	end
	
	def get_width
		@width
	end
	
	def get_global
		@@global_value
	end
	
	def set_global
		@@global_value += 1
	end
	
	def getArea
	@width*@height
	end
	
	def to_s
		"Height: #{height} Width: #{width} Constant is #{BOX_CONSTANT}"
	end

end



box1 = Box.new 12, 13
p box1.get_width
box1.set_global
p box1.get_global


box2 = Box.new 5, 6
p box2.get_width
box2.set_global
p box2.get_global

p "constant is #{Box::BOX_CONSTANT}"
