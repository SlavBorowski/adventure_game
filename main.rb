

require_relative './lib/start_menu.rb'
require_relative './lib/room.rb'
require_relative './lib/new_character.rb'
require_relative './lib/player_class.rb'
require_relative './lib/player_list.rb'


require 'json'

PLAYER_CLASSES = "./lib/player_classes.json"
PLAYERS_DATABASE = "./lib/saved_characters.json"



puts `clear`
start_menu_selection
