
class ToDoList
  include Enumerable
  attr_accessor :items
  def initialize
    @items = []
  end
  def each
    @items.each {|item| yield item}
  end
end

tdl = ToDoList.new
tdl.items = ["aaaa", "bbbbbbb", "ccccccccc"]
c = tdl.all? {|i| i.length>4}
puts c4