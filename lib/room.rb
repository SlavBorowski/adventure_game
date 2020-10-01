
class Room

  attr_accessor :id_number, :name, :description, :exits

  def initialize(id_number, name, description, exits)

    @id_number = id_number
    @name = name
    @description =description
    @exits = exits

  end


  def print_room

    puts "     #{self.name.capitalize}".colorize(:green)
    puts "     #{self.description}".colorize(:green)
    puts
    self.print_exits

  end  


  def check_exits

    exit_list = []
    self.exits.each_pair do |key, value|
      unless value == 0
        exit_list << key
      end
    end
    return exit_list

  end  


  def print_exits
    
    exit_list = self.check_exits
    print "     Exits:".colorize(:yellow)
    exit_list.each do |exit|
      print "    | #{exit} |".colorize(:yellow)
    end  
    puts
    puts
  end  

end 