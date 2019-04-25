require 'date'

class LogItem
  attr_accessor :name, :date

  #itemName is the name of the BasicFood and date is the date (civil format : xx/xx/xxxx) for which the food was added
  def initialize(itemName, date)
    @name = itemName
    @date = date
  end
  
  #Returns a string representation of this LogItem formatted for printing
  def to_s
    date_tokens = @date.to_s.split("-")
    date_string = "#{date_tokens[1]}/#{date_tokens[2]}/#{date_tokens[0]}"
    return "#{date_string}, #{name}"
  end
end
