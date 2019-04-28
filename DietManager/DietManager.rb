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
    if @dbChanged || @logChanged
      command_save
    end
  end
  
  #Handles the 'save' command which saves the FoodDB and Log if necessary
  def command_save
    if @dbChanged
      @database.save
      @dbChanged = false
    end
    if @logChanged
      @log.save
      @logChanged = false
    end
    puts "\n"
  end

  #Handles the 'new food' command which adds a new BasicFood to the FoodDB
  def command_newFood(name, calories)
    if @database.contains_food?(name)
      puts "Error: Food already in database!"
      return 0 
    end
    @database.add_basicFood(name, calories)
    @dbChanged = true
    puts "\n"
  end

  #Handles the 'new recipe' command which adds a new Recipe to the FoodDB
  def command_newRecipe(name, ingredients)
    if @database.contains_recipe?(name)
      puts "Error: Recipe already in database!"
      return 0
    end
    ingredients.each { |food|
      if !@database.contains?(food)
        puts "Error: Ingredient not in database!"
        return 0
      end
    }
    @database.add_recipe(name, ingredients)
    @dbChanged = true
    puts "\n"
  end

  #Handles the 'print' command which prints a single item from the FoodDB
  def command_print(name)
    puts @database.get(name)
    puts "\n"
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
    puts "\n"
    arr = @database.find_matches(prefix)
    arr.each { |item|
      puts item
    }
    puts "\n"
  end

  #Handles both forms of the 'log' command which adds a unit of the named item to the log for a certain date
  def command_log(name, date = Date.today)
    if !@database.contains?(name)
      puts "Error: Food not in database!"
      return 0
    end 
    @log.add_logItem(name, date)
    @logChanged = true
    puts "\n"
  end

  #Handles the 'delete' command which removes one unit of the named item from the log for a certain date
  def command_delete(name, date)
 
  end

  #Handles both forms of the 'show' command which displays the log of items for a certain date
  def command_show(date = Date.today)
 
  end

  #Handles the 'show all' command which displays the entire log of items
  def command_showAll
    puts "\n"
    items = @log.get_entries(nil)
    start = items[0].date
    date_tokens = start.to_s.split("-")
    time = "#{date_tokens[1]}/#{date_tokens[2]}/#{date_tokens[0]}"
    puts time
    items.each { |logitem|
      name = logitem.name.strip
      if logitem.date == start
        puts "  #{name}"
      else
        start = logitem.date
        date_tokens = start.to_s.split("-")
        time = "#{date_tokens[1]}/#{date_tokens[2]}/#{date_tokens[0]}"
        puts time
        puts "  #{name}"
      end
    }
    puts "\n"
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
  elsif line.start_with?("print")
    tokens = line.split(" ")
    dietManager.command_print(tokens[1])
  elsif line.start_with?("find")
    tokens = line.split(" ")
    dietManager.command_find(tokens[1])
  elsif line.start_with?("save")
    dietManager.command_save
  elsif line.start_with?("new food")
    tokens = line.split(" ")
    tokens.shift
    tokens.shift
    food = tokens.join(" ")
    food_tokens = food.split(",")
    dietManager.command_newFood(food_tokens[0], food_tokens[1].to_i)
  elsif line.start_with?("new recipe")
    tokens = line.split(" ")
    tokens.shift
    tokens.shift
    recipe = tokens.join(" ")
    rec_tokens = recipe.split(",")
    rec_name = rec_tokens[0]
    rec_tokens.shift
    ingredients = Array.new
    rec_tokens.each { |ingredient| 
      ingredients << ingredient.strip
    }
    dietManager.command_newRecipe(rec_name, ingredients)
  elsif line.start_with?("log")
    tokens = line.split(" ")
    tokens.shift
    resp = tokens.join(" ")
    log_tokens = resp.split(",")
    if log_tokens.length == 1
      dietManager.command_log(log_tokens[0], Date.today)
    end
    if log_tokens == 2
      name = log_tokens[0]
      date = log_tokens[1].split
      dietManager.command_log(name, date)
    end
  elsif line.start_with?("show all")
    dietManager.command_showAll
  else
    puts "Unknown command!"
  end
  
} #closes each iterator

#end MAIN
