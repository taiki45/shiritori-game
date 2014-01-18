require File.expand_path("../app", __FILE__)

if $0 == __FILE__
  game = Game.new
  game.setup
  game.start
end
