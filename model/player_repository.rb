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
    return if contain? player.name

    @players[player.name] = player
    @list.push player
    @counter.add
  end
end
