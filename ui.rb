module UI
  class << self
    def ask_player
      puts "Enter player name."
      puts "empty will end joining new player."
      print "> "
      name = gets.chomp
    end

    def ask_word
    end

    def show(word)
    end

    def tell_overlap(player)
    end

    def tell_shiritori_fail(player)
    end

    def tell_no_existence(player)
    end

    def tell_end_game(player)
      puts "Game ends in 
    end
  end
end
