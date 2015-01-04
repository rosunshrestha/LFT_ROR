
#Class Assignment 1: Write a module named MyFileModule. It should following methods:
 #                           a. create_file(path)
 #                           b. edit_file(path,content)

 #                           c. delete_file(path)

module MyFileModule
  class File
    def create_file path
      file = ::File.new(path,'w+')
      file.close()
     end


    def edit_file path, content
      file = ::File.new(path,'a+')
      file.puts content
      file.close
    end

    def delete_file path
      ::File.delete(path)
    end
  end

end

file = MyFileModule::File.new
path = 'hello.txt'
content = 'Added Text'
file.create_file(path)
file.edit_file(path,content)
file.delete_file(path)