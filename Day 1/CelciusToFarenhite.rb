repeat = "y"
while (repeat == "y")
  puts "Please enter a Temperature in Celcius"
  temp=gets.chomp
  if (temp.to_f.to_s==temp || temp.to_i.to_s==temp)
    temp=temp.to_f
    temp=temp * 9/5 + 32
    puts ('%.2f' % temp).to_s+"F"
    puts "Do you want check another Temperature?(y/n)"
    repeat=gets.chomp
  else
    puts "Sorry ,Please enter the valid  number "
  end
end
