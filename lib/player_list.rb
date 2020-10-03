# This class stores the list of esisting players from a JSON file.
class PlayerList

  attr_accessor :players

  def initialize

    @players = read_players

  end


  # Read the players from the JSON file.
  def read_players

    file_data = File.read(PLAYERS_DATABASE)

    if file_data.empty?
      []
    else
      JSON.parse(file_data).map do |player|
        Player.new(
          player['name'],
          player['short_description'],
          player['stats'],
          player['profession'],
          player['location']
        )
      end
    end

  end


  # Confirm if a player exists in the list.
  def find_player(player_name)

    players.each do |search|
      return true if player_name == search.name
    end
    false

  end 

  # Overwrite the list of players in JSON file.
  def write_players

    file_data = players.map do |player|
      {
        name: player.name,
        short_description: player.short_description,
        stats: player.stats,
        profession: player.profession,
        location: player.location
      }
    end
    File.write(PLAYERS_DATABASE, JSON.pretty_generate(file_data))

  end


  #Overwrite an individual player in the list.
  def overwrite_player(player)

    players.each do |search|
      if player.name == search.name
        search.name = player.name
        search.short_description = player.short_description
        search.stats = player.stats
        search.profession = player.profession
        search.location = player.location
      end
    end

  end


  # Load an individual player from the list.
  def load_player(name)

    players.each do |search|
      if name == search.name
        new_player = Player.new(
          search.name,
          search.short_description,
          search.stats,
          search.profession,
          search.location
        )
        return new_player
      end
    end
    puts "That character does not exist!".colorize(:red).indent(10)
  end

end