load "contactinfo.rb"

class Person
  include ContactInfo
end




class Teacher
  include ContactInfo
end
class Student
  include ContactInfo
end

t= Teacher.new
t.first_name="tfn"
t.last_name="tln"
t.full_name
p= Person.new
p.first_name="pfn"
p.last_name="pln"
p.full_name




