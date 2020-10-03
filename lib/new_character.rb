def create_character

  class_options = read_classes
  saved_players = PlayerList.new

  puts "OK let's start a new adventure.".colorize(:light_cyan).indent(10)

  name = get_text("name")
  while saved_players.find_player(name)
    puts "That name already exists. Please select another one.".colorize(:red).indent(10)
    name = get_text("name")
  end

  description = get_text("description")
  player_class = get_character_class(class_options)
  new_player = Player.new(name.downcase, description.downcase, player_class[1], player_class[0], 1)
  new_player.save(saved_players)

  new_player

end


def get_text(input)
  
  check = false
  until check == true
    puts "Please enter your character's #{input}.".colorize(:cyan).indent(10)
    print "***>".indent(10)
    user_input = gets.chomp
    puts "Your character's #{input} is: #{user_input.capitalize.bold}".colorize(:cyan).indent(10)
    check = confirm_text
  end
  user_input

end


def confirm_text

  puts "Is that correct? (yes or no)".colorize(:cyan).indent(10)
  print "***>".indent(10)

  case gets.chomp.downcase
  when "yes"
    puts
    true
  when "no"
    puts "OK let's try again.".colorize(:cyan).indent(10)
    puts
    false
  else
    puts "That's not a valid selection. Let's try again.".colorize(:cyan).indent(10)
    puts
    false
  end

end


def get_character_class(class_options)

  puts "Now it's time to choose a Class.".colorize(:cyan).indent(10)
  puts "Here are your options:".colorize(:cyan).indent(10)
  puts
  class_options.each { |n| n.print_class }

  loop do
    puts "Please enter one of the #{class_options.count} options:".colorize(:cyan).indent(10)
    print "***>".indent(10)
    selection = gets.chomp
    class_options.each do |n|
      return [selection, n.stats] if selection == n.name
    end
  end

end


def read_classes

  data = File.read(PLAYER_CLASSES)
  JSON.parse(data).map do |player_class|
    Character.new(
      player_class['name'],
      player_class['short_description'],
      player_class['stats']
    )
  end

end
