def read_players

  file_data = File.read(PLAYERS_DATABASE)

  if data.empty? 
    #save new character

  else  #check if character exists, overwrite if yes add new if no
    JSON.parse(data).map do |player|
      Character_Class.new(
        player_class['name'],
        player_class['short_description'],
        player_class['stats'],
        player_class['profession'],
      )
    end
  end

end