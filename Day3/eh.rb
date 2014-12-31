
def raise_exception
	#begin
		puts 'I am before the raise'
		raise 'An error has occured'
		puts 'I am after the raise'
	
	#rescue
		p 'I am rescued'
	#end
end

begin
	raise_exception
rescue => e
	p e
	p 'rescued part 2'
end
