def create_character

  class_options = read_classes
  saved_players = PlayerList.new

  puts "     OK let's start a new adventure."  
  
  name = get_text("name")
  while saved_players.find_player(name)
    puts "     That name already exists. Please select another one."
    name = get_text("name")
  end  

  description = get_text("description")
  player_class = get_character_class(class_options)
  new_player = Player.new(name.downcase, description.downcase, player_class[1], player_class[0])
  new_player.save(saved_players)

  return new_player

end


def get_text(input)
  
  check = false
  unless check == true 
    puts "     Please enter your character's #{input}."
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
      puts
      return true
    when "no"
      puts "     OK let's try again."   
      puts
      return false
    else
      puts "     That's not a valid selection. Let's try again."   
      puts
      return false  
  end

end

def get_character_class(class_options)

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
        return [selection, n.stats]
      end
    end  
  end

end  

def read_classes

  data = File.read(PLAYER_CLASSES)
  JSON.parse(data).map do |player_class|
    Character.new(
      player_class['name'],
      player_class['short_description'],
      player_class['stats'],
    )
  end

end





