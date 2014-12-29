repeat="y"
while (repeat=="y")

  flag=0

  puts "Please enter a number "


  num=gets.chomp
  if(num.to_i.to_s==num)
num=num.to_i
  i=1
  while (num>=2 && i< Math.sqrt(num).ceil)
    i+=1
    if(i==Math.sqrt(num).ceil)
      flag=1;
    elsif (num%i==0)
      break

    end

  end

  if (flag==0)
    puts num.to_s+" is not a prime number"
  else
    puts num.to_s+" is a prime number"
  end
  puts "Do you want check another number?(y/n)"
  repeat=gets.chomp
  else
    puts "Please enter a valid number"
  end


end