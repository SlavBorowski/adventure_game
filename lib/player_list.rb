class PlayerList
  
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
        profession: player.profession
      }
    end  
    File.write(PLAYERS_DATABASE, JSON.pretty_generate(file_data))
  
  end 


  def overwrite_player(player)

    self.players.each do |search|
      if player.name == search.name
        search.name = player.name
        search.short_description = player.short_description
        search.stats = player.stats
        search.profession = player.profession  
      end
    end
  
  end


  def load_player(name)

    self.players.each do |search|
      if name == search.name
        new_player = Player.new(
          search.name,
          search.short_description,
          search.stats,
          search.profession  
        )  
        return new_player
      end
    end
    puts "That character does not exist!".colorize(:red).indent(10)
  end  

end
