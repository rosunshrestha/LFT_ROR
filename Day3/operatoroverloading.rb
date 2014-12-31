class Box
	attr_accessor :height, :width
	def initialize(w,h)
		@width, @height = w, h
	end
	
	def ==(other)
		self.height == other.height && self.width == other.width
	end
	
	def to_s
		"Height: #{height}, Width: #{width}"
	end
end

box1 = Box.new 2, 2 
p box1.to_s
box2 = Box.new 2, 2
p box1.to_s
if box1 == box2
	p 'Equal'
else
	p 'Not Equal'
end


