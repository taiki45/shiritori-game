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
    UI.setup_done
  end

  def start
    players = InfiniteList.from_array(@player_repo.all)

    begin
      players.each do |player|
        raw_word = UI.ask_word
        raise EndGameError.new(player) unless raw_word

        existence = WordRepository.contain? raw_word
        raise ExistenceError.new(player) unless existence
        word = WordRepository.resolve(raw_word)

        error = @checker.invalid?
        error.player = player; raise error if error

        UI.show(word)
      end
    rescue GameError => e
      case e
      when OverlappingError
        UI.tell_overlap
      when ShiritoriError
        UI.tell_shiritori_fail
      when ExistenceError
        UI.tell_no_existence
      when EndGameError
        UI.tell_end_game
      end
    end
  end
end
