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
