Struct.new 'Animal', :tail_length, :horn do
	def ppp
		p "Hello World"
	end
end

animal1 = Struct::Animal.new '80cm', '20cm'
p animal1.tail_length
p animal1.horn
animal1.ppp
