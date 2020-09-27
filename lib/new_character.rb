def create_character

  puts "     OK let's start a new adventure."  
  name = get_text("name")
  description = get_text("description")
  player_class = get_character_class()
  
  puts name
  puts description
  puts player_class


  #new_player = Character.new(name, description, player_class)


  #save new player to player file

end


def get_text(input)
  
  check = false
  while check != true 
    puts "     Please enter a #{input} for your character."
    print "     ***>"
    user_input = gets.chomp
    puts "     Your character's #{input} is: #{user_input.capitalize}"
    
      check = confirm_text()
  end  
  return user_input
    
end  

def confirm_text

  puts "     Is that correct? (yes or no)"
  print "     ***>"
  case gets.chomp.downcase
    when "yes" 
      #check_name(name)
      puts "     Great, let's move to the next step."
      return true
    when "no"
      puts "     OK let's try again."   
      return false
  end

end
# Check if name already exits in saved characters

def get_character_class

  
  class_options = read_classes
  #["warrior", "mage", "rogue", "ranger"]
  
  puts "     Now it's time to choose a Class."
  puts "     Here are your options:"
  puts

  class_options.each do |n|
    
    n.print_class
      
  end  

  loop do

    puts "     Please enter one of the #{class_options.count} options:"
    print "     ***>"
    selection = gets.chomp
    
    class_options.each do |n|
      
      if selection == n.name  then 
        return selection
      end

    end  

    puts "     That is not a Class, please try again."
    
  
  end
  

end  

def read_classes

  data = File.read(PLAYER_CLASSES)
  JSON.parse(data).map do |player_class|
    Character_Class.new(
      player_class['name'],
      player_class['short_description'],
      player_class['description'],
      player_class['stats'],
    )
  end

end





