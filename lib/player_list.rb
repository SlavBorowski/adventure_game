class Player_List
  attr_accessor :players
  
  def initialize

    @players = read_players

  end
  
  
  def read_players

    file_data = File.read(PLAYERS_DATABASE)
  
    if file_data.empty? 
      return []
    else  
      JSON.parse(file_data).map do |player|
        Player.new(
          player['name'],
          player['short_description'],
          player['stats'],
          player['profession'],
        )
      end
    end

  end


  def find_player(player_name) 

    self.players.each do |search|
      if player_name == search.name
          return true
      end
    end
    return false

  end  


  def write_players

    file_data = self.players.map do |player|
      {
        name: player.name,
        short_description: player.short_description,
        stats: player.stats,
        profession: player.profession #whats tha matter with this
      }
    end  
    File.write(PLAYERS_DATABASE, JSON.pretty_generate(file_data))
  
  end 

end
