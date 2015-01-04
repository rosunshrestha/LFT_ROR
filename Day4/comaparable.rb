class Server
  attr_reader :name, :no_processors, :memory_gb  # we must provide readers to this attributes
 # include Comparable                             # because we are comparing the other Server with self
  def initialize(name, no_processors, memory_gb)
    @name = name
    @no_processors = no_processors
    @memory_gb = memory_gb
  end
  # def inspect
  #   "/Server: #{@name}: #{@no_processors} procs, #{@memory_gb} GiB mem/"
  # end
  def <=>(other)
    if self.no_processors == other.no_processors  # if there is the same number of procs
      self.memory_gb <=> other.memory_gb          # comparing memory
    else
      self.no_processors <=> other.no_processors  # otherwise comparing the number of processors
    end
  end
end


yoda = Server.new('yoda' , 32,64)



borg = Server.new('borg' , 32,256)

puts yoda<=>borg
kirk = Server.new('kirk' , 64,128)

vader = Server.new('vader' , 32,512)
test = Server.new('kirk' , 64,128)


puts kirk<=>vader


puts kirk<=>test

