

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
  puts "     Welcome to Isles of the Blessed!"
  puts "     Please ensure you set you terminal window to fullscreen."
  puts "     What would you like to do?"
  puts "     1. Start a NEW adventure."
  puts "     2. LOAD an existing game."
  puts "     3. EXIT the game."
  puts
  print "    ***>"

end


def start_menu_selection
  
  loop do
    display_start_menu
    user_choice = gets.chomp.downcase
    puts `clear`
    case user_choice
    when "new"
      create_character
    when "load"
      puts "This option is not implemented yet."
    when "exit"  
      puts
      puts "Thanks for playing Isles of the Blessed. See you soon!"
      exit
    else 
      puts "Please select from the options above: NEW, LOAD or EXIT"
    end  
  end  
end




