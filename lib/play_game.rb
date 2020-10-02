def start_game(character)

  puts "Game starting...".colorize(:light_cyan).indent(10)
  puts puts
  world = RoomList.new
  current_room = world.load_room(character.location)
  current_room.print_room
  puts
  puts "What would you like to do? Type 'help' if you need assistance.".colorize(:light_cyan).indent(10)
  puts
  interaction(character, world, current_room)

end  


def print_help

  puts
  puts "You can type a direction to move: 'north', 'south', 'east' and 'west'.".colorize(:red).indent(10)
  puts
  puts "You can type 'exits' to see which way you can go.".colorize(:red).indent(10)
  puts
  puts "You can type 'quit' to save your character and quit.".colorize(:red).indent(10)
  puts

end  

def quit_game(character)

  saved_players = PlayerList.new
  character.save(saved_players)
  puts "Thanks for playing Isles of the Blessed. See you soon!".colorize(:light_cyan).indent(10)
  exit

end  


def interaction(character, world, current_room)

  loop do
    print "***>".indent(10)
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
        puts
        puts "You move #{action}".indent(10)
        puts
        location = current_room.exits[action]
        character.location = location
        current_room = world.load_room(location)
        current_room.print_room
      else
        puts
        puts "You can not go that way!".colorize(:red).indent(10)
        puts
      end  
    else 
      puts "That is not a valid action, please try again. Type 'help' if you are stuck.".colorize(:red).indent(10)
    end  
  end  
  
end  

