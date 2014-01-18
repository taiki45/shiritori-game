class PlayerRepository
  def initialize
    @players = {}
  end

  def contain?(name)
    @players.has_key? name
  end

  def resolve(name)
    @players.fetch[name]
  end

  def all
    @players.values
  end

  def store(player)
    @players[player.name] = player
  end
end
