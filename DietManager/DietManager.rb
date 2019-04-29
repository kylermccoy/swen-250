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
    // if name isn't in database
    if @database.contains_food?(name.strip)
      puts "Error: Food already in database!"
      return 0 
    end
    // add food to database
    @database.add_basicFood(name.strip, calories)
    @dbChanged = true
    puts "\n"
  end

  #Handles the 'new recipe' command which adds a new Recipe to the FoodDB
  def command_newRecipe(name, ingredients)
    // if name isn't in database
    if @database.contains_recipe?(name.strip)
      puts "Error: Recipe already in database!"
      return 0
    end
    // if ingredients aren't in database
    ingredients.each { |food|
      if !@database.contains?(food.strip)
        puts "Error: Ingredient not in database!"
        return 0
      end
    }
    // add recipe to database
    @database.add_recipe(name.strip, ingredients)
    @dbChanged = true
    puts "\n"
  end

  #Handles the 'print' command which prints a single item from the FoodDB
  def command_print(name)
    puts "\n"
    puts @database.get(name.strip)
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
    // check if name is in database
    if !@database.contains?(name)
      puts "Error: Food not in database!"
      puts "\n"
      return 0
    end 
    // add food to log
    @log.add_logItem(name, date)
    @logChanged = true
    puts "\n"
  end

  #Handles the 'delete' command which removes one unit of the named item from the log for a certain date
  def command_delete(name, date)
    // check is name is in database
    if !@database.contains?(name)
      puts "Error: Food not in database!"
      puts "\n"
      return 0
    end
    // remove name from log
    @log.remove_logItem(name, date)
    @logChanged = true
    puts "\n"
  end

  #Handles both forms of the 'show' command which displays the log of items for a certain date
  def command_show(date = Date.today)
    puts "\n"
    items = @log.get_entries(date)
    if items == nil
      return 0
    end
    items.each { |item|
      puts item.name.strip
    }
    puts "\n"
  end

  #Handles the 'show all' command which displays the entire log of items
  def command_showAll
    puts "\n"
    items = @log.get_entries(nil)
    start = items[0].date
    date_tokens = start.to_s.split("-")
    // sets earliest time
    time = "#{date_tokens[1]}/#{date_tokens[2]}/#{date_tokens[0]}"
    puts time
    items.each { |logitem|
      name = logitem.name.strip
      // if item is from same day
      if logitem.date == start
        puts "  #{name}"
      else
        // item from other day reset current day
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

  // QUIT code
  if line.start_with?("quit") || line == "\n"
    dietManager.command_quit
    break
  
  // PRINT ALL code
  elsif line.start_with?("print all")
    dietManager.command_printAll

  // PRINT code
  elsif line.start_with?("print")
    tokens = line.split(" ")
    dietManager.command_print(tokens[1].strip)

  // FIND code
  elsif line.start_with?("find")
    tokens = line.split(" ")
    dietManager.command_find(tokens[1].strip)

  // SAVE code
  elsif line.start_with?("save")
    dietManager.command_save

  // NEW FOOD code
  elsif line.start_with?("new food")
    tokens = line.split(" ")
    tokens.shift
    tokens.shift
    food = tokens.join(" ")
    food_tokens = food.split(",")
    dietManager.command_newFood(food_tokens[0], food_tokens[1].to_i)

  // NEW RECIPE code
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

  // LOG code
  elsif line.start_with?("log")
    tokens = line.split(" ")
    tokens.shift
    resp = tokens.join(" ")
    log_tokens = resp.split(",")
    // if log is for current day
    if log_tokens.length == 1
      dietManager.command_log(log_tokens[0].strip, Date.today)
    // if log is for specific day
    elsif log_tokens.length == 2
      name = log_tokens[0].strip
      date_string = log_tokens[1].strip
      date_tokens = date_string.split("/")
      date = Date.parse("#{date_tokens[2]}-#{date_tokens[0]}-#{date_tokens[1]}")
      dietManager.command_log(name, date)
    end

  // SHOW ALL code
  elsif line.start_with?("show all")
    dietManager.command_showAll

  // SHOW code
  elsif line.start_with?("show")
    tokens = line.split(" ")
    // if show is for current day
    if tokens.length == 1
      dietManager.command_show(Date.today)
    // if show is for specific day
    elsif tokens.length == 2
      date_string = tokens[1]
      date_tokens = date_string.split("/")
      date = Date.parse("#{date_tokens[2]}-#{date_tokens[0]}-#{date_tokens[1]}")
      dietManager.command_show(date)
    end

  // DELETE code
  elsif line.start_with?("delete")
    tokens = line.split(" ")
    tokens.shift
    resp = tokens.join(" ")
    delt = resp.split(",")
    name = delt[0].strip
    date_string = delt[1].strip
    date_tokens = date_string.split("/")
    date = Date.parse("#{date_tokens[2]}-#{date_tokens[0]}-#{date_tokens[1]}")
    dietManager.command_delete(name, date)

  // UNKNOWN command code
  else
    puts "Unknown command!"
  end
  
} #closes each iterator

#end MAIN
