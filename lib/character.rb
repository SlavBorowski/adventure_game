class Character

  attr_accessor :name, :short_description, :stats 

  def initialize(name, short_description, stats)
    @name = name
    @short_description = short_description
    @stats = stats
  end

  def print_class

    puts "* #{name.capitalize} *".colorize(:light_green).bold.indent(10)
    puts
    puts "#{short_description}".colorize(:green).indent(10)
    puts
    stats.each_pair do |name, value|
      print "| ".colorize(:green).indent(10)
      print " #{name.capitalize} :".colorize(:light_green)
      print " #{value}"
      print " |".colorize(:green)
    end
    puts
    puts

  end

end
