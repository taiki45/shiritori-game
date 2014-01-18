module UI
  class << self
    def ask_player
      puts "Enter player name."
      puts "empty will end joining new player."
      print "> "
      name = gets.chomp
      name.empty? ? nil : name
    end

    def ask_word(player)
      puts "* " * 30
      puts "#{player.name}'s turn."
      puts "Enter your word"
      puts "To quit the game, enter `:quit`."
      print "> "

      raw_word = get.chomp

      if raw_word == ":quit"
        nil
      else
        raw_word = ask_word(player) if raw_word.empty?
        raw_word
      end
    end

    def show_result(player, word)
      puts "#{player.name} answered #{word.origin}."
      puts "#{word.origin} is same as #{word.normal_form}."
    end

    def tell_overlap(player)
    end

    def tell_shiritori_fail(player)
    end

    def tell_no_existence(player)
    end

    def tell_end_game(player)
      puts "Game ends in"
    end
  end
end
