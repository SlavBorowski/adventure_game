class Character

  attr_accessor :name, :short_description, :stats 

  def initialize(name, short_description, stats)
    @name = name
    @short_description = short_description
    @stats = stats
  end

  def print_class

    puts "     * #{name.capitalize}".colorize(:light_green)
    puts
    puts "       #{short_description}".colorize(:green)
    puts
    stats.each_pair do |name, value|
      print "      | #{name.capitalize} :  #{value} |".colorize(:green)
    end
    puts
    puts

  end

end
