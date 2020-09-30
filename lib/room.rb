
class Room

  attr_accessor :id_number, :name, :description, :exits

  def initialize(id_number, name, description, exits)

    @id_number = id_number
    @name = name
    @description =description
    @exits = exits

  end


  def print_room

    puts "     #{self.name.capitalize}"
    puts
    puts "     #{self.description.capitalize}"
    puts
    print "     Exits:"
    self.exits.each_pair do |key, value|
      unless value == 0
        print " | #{key.capitalize} |"
      end
    end
    puts

  end  

end 