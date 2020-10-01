def display_start_menu
  puts <<-'EOF'

                      -/+syhddmdddho //:.                 
                    `::-MMMMMMMMMMMMMM+dMMMMNdy/.            
                  :yNMM/MMMMMMMMMMMMMMMMMMMMMMMMMmo.         
                :dMMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMNh+`        
              -dMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMms-            
            oMMMMMMMMMMMMMMMMMNNNNMMMMMMMMNs-               
          `hMMMMMMMMMMMMmdddhhdmdddhhhhhd+`                 
          hMMMMMMMMMMNmdNMMMMMMMMMMMMMMm`                   
          +MMMMMMMMMMNmMMMMMmdhhhhdmNMMN-                    
          NMMMMMMMMMNMMMmyyyhmMMMMNdyo+-                     
        `smMMMMMMMNMMmhdMMMMMMMMMMMMMMNs.-y                 
        /MMMMMMMMMMMhmMMMMMMMMMMMMMMMMMNMMN                 
        :MMMMMMMMMMdNMMMMMMMMMMMMMMMNNNMMMM.                
        .MMMMMMMMMNmMMMMMMMMMMMMNNNNMMMMMMM/                
          dmNMMMMmhyMMMMMMMMMNmmmNMMMMMMMMMMs                
          -dMMMN/   hMMNmmmmmMMMMMMMMMMMMMMMd                
          .MMMh`   `dMNMMMMMMMMMMMMMMhhddNMMM`               
          /Mh      .MMMMMMMMMMMMMMMN/    -+m:               
            /.       oNNNmmdhNMMMMMMMMdyyyy+s+               
                      mMMMMh`hMMMMMMMMMMMMN+yy               
                    :MMMMh` :MMMMMMMMMMMMMyyd               
                  `oMMMm+   :MMMMMMMMMMMMMdos               
                  -oso:     oNMMMMMMMMMMMMmsd               
                              :yNMMMMMMMMMM+M`              
                                  :yNMMMMMMM+M+              
                                    `/yNMMMMdyN:             
                                        -smMMdhN:            
                                          ./ss`.

  EOF
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


def start_menu_selection

  loop do
    display_start_menu
    user_choice = gets.chomp.downcase
    puts `clear`
    case user_choice
    when "new"
        start_game(create_character)
    when "load"
      load_game
    when "quit"  
      puts
      puts "Thanks for playing Isles of the Blessed. See you soon!".colorize(:light_cyan).indent(10)
      exit
    else 
      puts "Please select from the options above: NEW, LOAD or QUIT".colorize(:red).indent(10)
    end  
  end  
end


def load_game

  name = get_text("name")
  players = PlayerList.new
  until players.find_player(name)
    puts "That character does not exist!".colorize(:red).indent(10)
    name = get_text("name")
  end
  returning_player = players.load_player(name)
  puts "Loading your character:".colorize(:light_cyan).indent(10)
  puts
  returning_player.print_player
  puts puts puts puts puts
  start_game(returning_player)

end  

