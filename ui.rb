module UI
  class << self
    def ask_player
      puts "Enter player name."
      puts "empty will end joining new player."
      print "> "
      name = gets
      return nil unless name

      name = name.chomp
      name.empty? ? nil : name
    end

    def setup_done(players)
      puts "All players are:"
      players.each {|p| puts "* #{p.name}" }
    end

    def ask_word(player)
      loop do
        puts "* " * 30
        puts "#{player.name}'s turn."
        puts "Enter your word"
        puts "To quit the game, enter `:quit`."
        print "> "

        raw_word = gets
        return nil unless raw_word
        raw_word = raw_word.chomp

        case raw_word
        when ":quit"
          return nil
        when ""
          next
        else
          return raw_word
        end
      end
    end

    def show_result(player, word)
      puts "#{player.name} answered #{word.origin}."
      puts "#{word.origin} is same as #{word.normal_form}."
    end

    def tell_overlap(player)
      puts "Overlapping Word"
      puts "#{player.name} lost."
    end

    def tell_shiritori_fail(player)
      puts "Shiritori fail"
      puts "#{player.name} lost."
    end

    def tell_no_existence(player)
      puts "No existence with: "
      puts "#{player.name} lost."
    end

    def tell_end_game(player)
      puts "Game ends."
    end
  end
end
