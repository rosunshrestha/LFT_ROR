#class for the time
class Time
  attr_accessor :hour, :minute, :second, :millisecond
  def initialize hour, minute, second, millisecond
    @hour = hour.to_i
    @minute = minute.to_i
    @second = second.to_i
    @millisecond = millisecond.to_i
  end

  def adjustTime
    @second += @millisecond / 1000
    @millisecond = @millisecond % 1000
    @minute += @second / 60
    @second = @second % 60
    @hour += @minute / 60
    @minute = @minute % 60
  end

  def printTime
    "#{@hour.to_s.rjust(2,'0')}:#{@minute.to_s.rjust(2,'0')}:#{@second.to_s.rjust(2,'0')},#{@millisecond.to_s.rjust(3,'0')}"
  end
end

def changeTime timeInSec,name
  file = File.open(name)
  newfile = File.new('1'+name,'w')
  file.each_line do |line|
    if(line.include?'-->')
      line.gsub(/\s+/, "")
      two_times = line.to_s.split('-->')
      time1 = two_times[0].to_s.split(':')
      time2 = two_times[1].to_s.split(':')
      time1second = time1[2].to_s.split(',')
      time2second = time2[2].to_s.split(',')
      startTime = Time.new time1[0], time1[1], time1second[0], time1second[1]
      startTime.millisecond += timeInSec.to_i
      startTime.adjustTime
      endTime = Time.new time2[0], time2[1], time2second[0], time2second[1]
      endTime.millisecond += timeInSec
      endTime.adjustTime
      newfile.print startTime.printTime + ' --> '
      newfile.puts endTime.printTime
    else
      newfile.puts line
    end
  end
  newfile.close
  file.close
end

puts 'Please Enter the file name in the current directory'
name = gets.chomp.to_s
if(File.extname(name).downcase != ".srt")
  puts 'Please enter the srt file'
elsif File::exists?(name)
  puts 'Enter the time in second(- for delay)'
  time = gets.chomp.to_i
  changeTime time,name
else
    puts 'File not found'
end
