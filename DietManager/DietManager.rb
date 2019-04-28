require './FoodDB'
require './Log'

class DietManager
  def initialize()
    @dbFile = "FoodDB.txt"
    @logFile = "DietLog.txt"
    @database = FoodDB.new(@dbFile)
    @log = Log.new(@logFile)
    @dbChanged = false
    @logChanged = false

  end


  
  #Handles the 'quit' command which exits the DietManager
  def command_quit
    command_save
  end
  
  #Handles the 'save' command which saves the FoodDB and Log if necessary
  def command_save
    @database.save
  end

  #Handles the 'new food' command which adds a new BasicFood to the FoodDB
  def command_newFood(name, calories)
 
  end

  #Handles the 'new recipe' command which adds a new Recipe to the FoodDB
  def command_newRecipe(name, ingredients)

  end

  #Handles the 'print' command which prints a single item from the FoodDB
  def command_print(name)

  end

  #Handles the 'print all' command which prints all items in the FoodDB
  def command_printAll
    puts "\n"
    @database.basicFoods.each { |food|
      puts food
    }
    puts "\n"
    @database.recipes.each { |rec|
      puts rec
    }
    puts "\n"
  end

  #Handles the 'find' command which prints information on all items in the FoodDB matching a certain prefix
  def command_find(prefix)
  
  end

  #Handles both forms of the 'log' command which adds a unit of the named item to the log for a certain date
  def command_log(name, date = Date.today)
 
  end

  #Handles the 'delete' command which removes one unit of the named item from the log for a certain date
  def command_delete(name, date)
 
  end

  #Handles both forms of the 'show' command which displays the log of items for a certain date
  def command_show(date = Date.today)
 
  end

  #Handles the 'show all' command which displays the entire log of items
  def command_showAll

  end
  
end #end DietManager class


#MAIN

dietManager = DietManager.new

puts "Input a command > "

#Read commands from the user through the command prompt
$stdin.each{|line|
  
#Handle the input
  if line.start_with?("quit") || line == "\n"
    dietManager.command_quit
    break
  elsif line.start_with?("print all")
    dietManager.command_printAll
  else
    puts "Unknown command!"
  end
  
} #closes each iterator

#end MAIN
