class Character_Class

  attr_accessor :name, :short_description, :description, :stats 

  def initialize(name, short_description, description, stats)
    @name = name
    @short_description = short_description
    @description = description
    @stats = stats
  end

  def print_class

    puts "     * #{name.capitalize}"
    puts
    puts "       #{short_description}"
    puts
    stats.each_pair do |name, value|
      print "      | #{name.capitalize} :  #{value} |"
    end
    puts
    puts

  end

end


class Player < Character_Class

  attr_accessor :profession

  def initialize(name, short_description, stats, profession)
    @name = name
    @short_description = short_description
    @stats = stats
    @profession = profession
  end

  def save

    saved_players = read_players
    p saved_players

    if find_player(self, "save")[0] 
      write_players(saved_players)
    else 
      saved_players << self
      p saved_players
      write_players(saved_players)
    end  
    puts "You're character has been saved."
  end

end  


def read_players

  file_data = File.read(PLAYERS_DATABASE)

  if file_data.empty? 
    return []

  else  
    JSON.parse(file_data).map do |player|
      Player.new(
        player_class['name'],
        player_class['short_description'],
        player_class['stats'],
        player_class['profession'],
      )
    end
  end

end


def write_players(saved_players)
  file_data = saved_players.map do |player|
    {
      name: player.name,
      short_description: player.short_description,
      stats: player.stats,
      profession: player.profession #whats tha matter with this
    }
  end  

  File.write(PLAYERS_DATABASE, JSON.pretty_generate(file_data))

end  

def find_player(player, action) 

  player_list = read_players

  player_list.each do |search|
    
    if player.name == search.name
      #change this case maybe dont need load/save
      case action
      when "save"  
        overwrite_player(player_list, player)
        return [true, 0]
      when "load"
        loaded = player.load
        return [true, loaded]
      end    
    end

  end
  return [false, 0]

end  


