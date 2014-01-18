class Game
  def initialize
    @player_repo = PlayerRepository.new
    @word_repo = WordRepository.new
    @checker = Checker.new
  end

  def setup
    while name = UI.ask_player
      @player_repo.store(Player.new(name))
    end

    UI.setup_done(@player_repo.all)
  end

  def start
    players = InfiniteList.from_array(@player_repo.all)

    begin
      players.each do |player|
        raw_word = UI.ask_word(player)
        raise EndGameError.new(player) unless raw_word

        existence = @word_repo.contain? raw_word
        raise ExistenceError.new(player) unless existence
        word = @word_repo.resolve(raw_word)

        error = @checker.invalid?(word)
        if error
          error.player = player
          raise error
        end

        UI.show_result(player, word)
      end

    rescue GameError => e
      case e
      when OverlappingError
        UI.tell_overlap(e.player)
      when ShiritoriError
        UI.tell_shiritori_fail(e.player)
      when ExistenceError
        UI.tell_no_existence(e.player)
      when EndGameError
        UI.tell_end_game(e.player)
      end
    end
  end
end
