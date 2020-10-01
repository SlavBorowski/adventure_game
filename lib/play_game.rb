def start_game(character)

  puts "     Game starting..."
  puts puts
  location = 4
  world = RoomList.new
  current_room = world.load_room(location)
  current_room.print_room
  puts
  puts "     What would you like to do?"
  puts
  loop do
    print "    ***>"
    action = gets.chomp.downcase
    case action
    when "quit"
      quit_game(character)
    when "help" 
      print_help 
    when "exits"
      puts
      current_room.print_exits
      puts 
    when "north", "south", "east", "west"  
      if current_room.check_exits.include?(action)
        puts "     You move #{action}"
        puts
        location = current_room.exits[action]
        current_room = world.load_room(location)
        current_room.print_room
        puts location
      else
        puts
        puts "     You can not go that way!"
      end  
    else 
      puts "     That is not a valid action, please try again. Type 'help' if you are stuck."
    end  
  end  

end  


def print_help

  puts
  puts "     You can type a direction to move: 'north', 'south', 'east' and 'west'."
  puts
  puts "     You can type 'exits' to see which way you can go."
  puts
  puts "     You can type 'quit' to save your character and quit."
  puts

end  

def quit_game(character)

  saved_players = PlayerList.new
  character.save(saved_players)
  puts "     Thanks for playing Isles of the Blessed. See you soon!"
  exit

end  


def move(action)

  
    
  location = next_room

end  

