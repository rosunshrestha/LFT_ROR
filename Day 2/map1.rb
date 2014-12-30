def custom_map(array)
  arr=[]
  for i in 0..array.length-1
    arr[i]=yield array[i]
  end
  return arr
end
mappedArray=custom_map([1,2,3,4,5]){|x|x*2*x}
print mappedArray

