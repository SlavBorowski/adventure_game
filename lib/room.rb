
class Room

  def initialize(id, name, description, exits, npcs, items, special)

    @id = id
    @name = name
    @description =description
    #use a hash for exits
    @exits = exits
    #array of npc ids
    @npcs = npcs
    #array of item ids
    @items = items
    @special = special

  end

end 