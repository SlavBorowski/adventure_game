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
      puts "     Your progress has been saved."
      puts
    else 
      saved_players.players << self
      saved_players.write_players
      puts "     You're character has been saved."
      puts
    end  

  end


  def print_player

    puts "     Name:        #{self.name.capitalize}"
    puts
    puts "     Class:       #{self.profession.capitalize}"
    puts
    puts "     Description: #{self.short_description.capitalize}"
    puts
    print "     Stats:"
    self.stats.each_pair do |name, value|
      print "      | #{name.capitalize} :  #{value} |"
    end

  end  

end  
