class RoomList

  attr_accessor :rooms

  def initialize

    @rooms = read_rooms

  end


  def read_rooms

    file_data = File.read(WORLD_DATABASE)

    JSON.parse(file_data).map do |room|
      Room.new(
        room['id_number'],
        room['name'],
        room['description'],
        room['exits']
      )
    end

  end


  def write_rooms

    file_data = rooms.map do |current_room|
      {
        id_number: current_room.id_number,
        name: current_room.name,
        description: current_room.description,
        exits: current_room.exits
      }
    end
    File.write(WORLD_DATABASE, JSON.pretty_generate(file_data))

  end


  def load_room(room_id)

    rooms.each do |search|
      if room_id == search.id_number
        found_room = Room.new(
          search.id_number,
          search.name,
          search.description,
          search.exits
        )
        return found_room
      end
    end

  end

end
