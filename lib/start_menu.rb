# Display the start menu.
def display_start_menu
  
  ascii_image
  puts "Welcome to Isles of the Blessed!".colorize(:light_cyan).indent(10)
  puts "Please ensure you set you terminal window to fullscreen.".colorize(:light_cyan).indent(10)
  puts "What would you like to do?".colorize(:light_cyan).indent(10)
  puts
  puts "1. Start a NEW adventure.".colorize(:light_yellow).indent(10)
  puts "2. LOAD an existing game.".colorize(:light_yellow).indent(10)
  puts "3. QUIT the game.".colorize(:light_yellow).indent(10)
  puts
  print "***>".indent(10)

end


# Get user choice for start menu.
def start_menu_selection

  loop do
    display_start_menu
    user_choice = gets.chomp.downcase
    puts `clear`
    case user_choice
    # Create a new character and start the game.
    when "new"
      start_game(create_character)
    # Load an existing character and start the game.  
    when "load"
      name = get_text("name")
      load_game(name)
    # Quit the game.  
    when "quit"
      puts
      puts "Thanks for playing Isles of the Blessed. See you soon!".colorize(:light_cyan).indent(10)
      exit
    else
      puts "Please select from the options above: NEW, LOAD or QUIT".colorize(:red).indent(10)
    end
  end
end


# Load game for existing character.
def load_game(name)

  ARGV.pop
  # Find and load player.
  players = PlayerList.new
  until players.find_player(name)
    puts "That character does not exist!".colorize(:red).indent(10)
    name = get_text("name")
  end
  returning_player = players.load_player(name)
  puts `clear`
  puts "Welcome back!".bold.colorize(:light_cyan).indent(10)
  puts
  # Start game for existing player.
  start_game(returning_player)

end
