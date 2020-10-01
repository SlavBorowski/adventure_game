#gems
require 'colorize'


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



puts `clear`
start_menu_selection
