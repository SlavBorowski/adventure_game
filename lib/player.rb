# Player class is a child of character class and is used to store player information.
class Player < Character

  attr_accessor :profession, :location

  def initialize(name, short_description, stats, profession, location)

    @name = name
    @short_description = short_description
    @stats = stats
    @profession = profession
    @location = location

  end

  # Save individual player into list of players.
  def save(saved_players)

    # Save exsting player.
    if saved_players.find_player(name)
      saved_players.overwrite_player(self)
      saved_players.write_players
      puts `clear`
      puts "Your progress has been saved.".colorize(:light_cyan).indent(10)
      puts
    # Save new player.
    else
      saved_players.players << self
      saved_players.write_players
      puts `clear`
      puts "You're character has been saved.".colorize(:light_cyan).indent(10)
      puts
    end

  end

  # Print all the informatio of a player excluding location.
  def print_player

    print "Name:        ".colorize(:yellow).indent(10)
    print name.capitalize.bold.colorize(:light_yellow)
    puts puts
    print "Class:       ".colorize(:yellow).indent(10)
    print profession.capitalize.colorize(:light_yellow)
    puts puts
    print "Description: ".colorize(:yellow).indent(10)
    print short_description.capitalize.colorize(:light_yellow)
    puts puts
    print "Stats:".colorize(:yellow).indent(10)
    stats.each_pair do |name, value|
      print "| ".colorize(:yellow).indent(5)
      print " #{name.capitalize} :  ".colorize(:light_yellow)
      print value.to_s
      print " |".colorize(:yellow)
    end

  end

end
