repeat="y"
while (repeat=="y")
  puts "Please enter a text"
  text=gets.chomp
  text=text.downcase
  puts text
  puts "Do you want Convert another word?(y/n)"
  repeat=gets.chomp
end

