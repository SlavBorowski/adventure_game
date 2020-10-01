class Player < Character

  attr_accessor :profession

  def initialize(name, short_description, stats, profession)

    @name = name
    @short_description = short_description
    @stats = stats
    @profession = profession

  end

  def save(saved_players)

    if saved_players.find_player(self.name) 

      saved_players.overwrite_player(self)
      saved_players.write_players
      puts `clear`
      puts "     Your progress has been saved.".colorize(:light_cyan)
      puts
    else 
      saved_players.players << self
      saved_players.write_players
      puts `clear`
      puts "     You're character has been saved.".colorize(:light_cyan)
      puts
    end  

  end


  def print_player

    puts "     Name:        #{self.name.capitalize}".colorize(:yellow)
    puts
    puts "     Class:       #{self.profession.capitalize}".colorize(:yellow)
    puts
    puts "     Description: #{self.short_description.capitalize}".colorize(:yellow)
    puts
    print "     Stats:".colorize(:yellow)
    self.stats.each_pair do |name, value|
      print "      | #{name.capitalize} :  #{value} |".colorize(:yellow)
    end

  end  

end  
