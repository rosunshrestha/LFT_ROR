old=0
current=1
puts old
puts current
for i in 1..18
  new=old+current
  puts new
  old=current
  current=new
end