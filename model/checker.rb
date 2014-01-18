class Checker
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

  class ShiritoriChecker
    def initialize
      @before_word = nil
    end

    def valid?(word)
      return true unless @before_word

      result = last_char(@before_word) == first_char(word)
      @before_word = word
      result
    end

    def last_char(word)
      word.origin[-1]
    end

    def first_char(word)
      word.origin[0]
    end
  end

  CHECKERS = [OverlappingChecker, ShiritoriChecker].freeze

  def initialize
    @checkers = CHECKERS.map {|c| c.new }
  end

  def check(word)
    @checkers.map {|checker| checker.valid?(word) }.all?
  end
end
