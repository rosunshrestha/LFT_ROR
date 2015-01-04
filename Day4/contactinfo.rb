module ContactInfo
  attr_accessor :first_name, :last_name, :city, :state

  def full_name
    puts @first_name + " " + @last_name
  end
end
