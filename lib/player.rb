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
      puts "Your progress has been saved.".colorize(:light_cyan).indent(10)
      puts
    else 
      saved_players.players << self
      saved_players.write_players
      puts `clear`
      puts "You're character has been saved.".colorize(:light_cyan).indent(10)
      puts
    end  

  end


  def print_player

    puts "Name:        #{self.name.capitalize}".colorize(:yellow).indent(10)
    puts
    puts "Class:       #{self.profession.capitalize}".colorize(:yellow).indent(10)
    puts
    puts "Description: #{self.short_description.capitalize}".colorize(:yellow).indent(10)
    puts
    print "Stats:".colorize(:yellow).indent(10)
    self.stats.each_pair do |name, value|
      print "| #{name.capitalize} :  #{value} |".colorize(:yellow).indent(5)
    end

  end  

end  
