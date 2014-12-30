def custom_map(mapping,array)
	formula=''
	mapping.each_char 	do |x| 
							if(x=='x')
								formula+='array[i]'
							elsif
								formula+=x.to_s
							end
						end
	
	for i in 0..array.length-1
		yield eval(formula)
	end
end

custom_map('x*x',[1,2,3,4,5]){|x| puts x}

