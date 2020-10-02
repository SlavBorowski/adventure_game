#gems
require 'colorize'
require 'inkjet'

#modules
require 'json'


# files
require_relative './lib/start_menu.rb'
require_relative './lib/room.rb'
require_relative './lib/room_list.rb'
require_relative './lib/new_character.rb'
require_relative './lib/character.rb'
require_relative './lib/player.rb'
require_relative './lib/player_list.rb'
require_relative './lib/play_game.rb'


PLAYER_CLASSES = "./lib/player_classes.json"
PLAYERS_DATABASE = "./lib/saved_characters.json"
WORLD_DATABASE = "./lib/rooms.json"


if ARGV.length == 0
  puts `clear`
  start_menu_selection
elsif ARGV.length == 1
  load_game(ARGV[0])
else
  puts "You have entered to many arguments. You can enter your character name as an argument to load your character (e.g program_name -aragorn) or nothing to launch the start menu."  
end