
class Room

  attr_accessor :id_number, :name, :description, :exits

  def initialize(id_number, name, description, exits)

    @id_number = id_number
    @name = name
    @description =description
    @exits = exits

  end


  def print_room

    exit_list = self.check_exits
    puts "     #{self.name.capitalize}"
    puts
    puts "     #{self.description.capitalize}"
    puts
    print "     Exits:"
    exit_list.each do |exit|
      print "    | #{exit} |"
    end  
    puts

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

end 