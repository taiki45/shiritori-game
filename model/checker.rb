class WordChecker
  class OverlappingChecker
    def initialize
      @words = {}
    end

    def valid?(word)
      invalid = overlap? word
      return false if invalid

      store(word)
      true
    end

    private

    def store(word)
      @words[word] = true
    end

    def overlap?(word)
      !!@words[word]
    end
  end

  CHECKERS = [OverlappingChecker].freeze

  def initialize
    @checkers = CHECKERS.map {|c| c.new }
  end

  def check(word)
    @checkers.map {|checker| checker.valid?(word) }.all?
  end
end
