class GameError < StandardError
  attr_accessor :player

  def initialize(player = nil)
    @player = player
  end
end

ExistenceError = Class.new(GameError)
OverlappingError = Class.new(GameError)
ShiritoriError = Class.new(GameError)
EndGameError = Class.new(GameError)
