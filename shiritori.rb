module UI
  class << self
    def ask
    end

    def respond(answear)
    end
  end
end

class PlayerRepository
  def store
  end

  def resolve(id)
  end

  def next_player
  end
end

class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end
end


module WordChecker
  class << self
    CHECKERS = [OverlappingChecker].freeze

    def check(word)
      CHECKERS.map {|checker| checker.valid?(word) }.all?
    end
  end

  module OverlappingChecker
    class << self
      def valid?(word)
        invalid = overlap? word
        return false if invalid

        store(word)
        true
      end

      private

      def store(word)
        words[word] = true
      end

      def overlap?(word)
        !!word[word]
      end

      def words
        @words ||= {}
      end
    end
  end

  module ExistenceChecker
    class << self
      def valid?(word)
      end
    end
  end
end

class WordRepository
  def contain?(word)
    page = WikiPedia.find(word)
    return false unless page.content

    Word.new(word, page.title)
  end
end

if $0 == __FILE__
  loop do
    break
  end
end
