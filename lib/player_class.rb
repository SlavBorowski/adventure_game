class Character

  attr_accessor :name, :short_description, :stats 

  def initialize(name, short_description, stats)
    @name = name
    @short_description = short_description
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
    else 
      saved_players.players << self
      saved_players.write_players
      puts "     You're character has been saved."
    end  

  end


  def print_player

    puts "     Name:        #{self.name.capitalize}"
    puts "     Class:       #{self.profession.capitalize}"
    puts "     Description: #{self.short_description.capitalize}"
    puts "     Stats:"
    self.stats.each_pair do |name, value|
      print "      | #{name.capitalize} :  #{value} |"
    end
    puts

  end  

end  
