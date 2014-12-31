def divide
	puts "Enter a number to divide"
	number =gets.chomp.to_f
	puts "Enter a Divisor"
	div =gets.chomp.to_f
	if div==0
		raise 'cant divide by zero'
	else
		ans = (number/div).to_f
		puts "The quotient is #{ans}"
	end
end

begin
	divide
rescue ZeroDivisionError
	p e
end
