
class Room

  attr_accessor :id_number, :name, :description, :exits

  def initialize(id_number, name, description, exits)

    @id_number = id_number
    @name = name
    @description = description
    @exits = exits

  end


  def print_room

    puts name.capitalize.colorize(:green).bold.indent(10)
    puts description.colorize(:light_green).indent(10)
    puts
    print_exits

  end


  def check_exits

    exit_list = []
    exits.each_pair do |key, value|
      unless value == 0
        exit_list << key
      end
    end
    exit_list

  end


  def print_exits

    exit_list = check_exits
    print "Exits:".colorize(:yellow).indent(10)
    exit_list.each do |exit|
      print "| #{exit} |".colorize(:yellow).bold.indent(5)
    end
    puts puts
  end

end
