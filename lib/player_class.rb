class Character_Class

  attr_accessor :name, :short_description, :description, :stats 

  def initialize(name, short_description, description, stats)
    @name = name
    @short_description = short_description
    @description = description
    @stats = stats
    #@skills
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

  def initialize(name, short_description, stats, profession)
    @name = name
    @short_description = short_description
    @stats = stats
    @profession = profession
    #@skills
  end

  def save(player)

    
    data = player





  end

end  
