
repeat="y"
while (repeat=="y")
	puts "Please enter a year"
	year=gets.chomp
	if ( year.to_i.to_s==year )
		year=year.to_i
		if(year%400==0)
			puts year.to_s+" Is a Leap year "
		elsif(year%100==0)
			puts year.to_s+"  is not a leap Year"
		elsif(year%4==0)
			puts year.to_s+"  is a leap Year"
		else
			puts year.to_s+" is not a leap year"
		end
		puts"Do you want check another year?(y/n)"
		repeat=gets.chomp
	else
		puts "Sorry ,Please enter the valid  number "
	end
end

