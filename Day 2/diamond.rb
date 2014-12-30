
a = [1,1,1,1,2,3,49,53,6,27,18,1,2]
#a=[1,2,3,4,5,6,7,8,12]
#a=[2,2,5]
flag=1
sum = a.inject(0) {|sum, element| sum+element}

if(sum%3==0)
  count=0
  person1, person2, person3 = [], [], []
  person1_total, person2_total, person3_total = 0, 0, 0
  allocated = sum/3
  b = a.sort.reverse
  while(count < a.length)
    if((person3_total+b[count]) <= allocated)
      person3.push(b[count])
      person3_total+ = b[count]
      count+ = 1
    elsif((person2_total+b[count]) <= allocated)
      person2.push(b[count])
      person2_total+ = b[count]
      count+ = 1
    elsif((person1_total+b[count])< = allocated)
      person1.push(b[count])
      person1_total+ = b[count]
      count+ = 1
    else
      count = a.length
      flag = 0
      puts "Cannot distribute equally to 3 peoples"
    end
  end
  if(flag == 1)
	  person1 = person1.sort
	  person2 = person2.sort
	  person3 = person3.sort
	  puts "Person1#{person1}"
	  puts "Person2#{person2}"
	  puts "Person3#{person3}"
  end
else
  puts "Cannot distribute equally to 3 peoples"
end
