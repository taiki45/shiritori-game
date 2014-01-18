class Checker
  class OverlappingChecker
    def initialize
      @words = {}
    end

    def invalid?(word)
      invalid = overlap? word
      return OverlappingError.new if invalid

      store(word)
      nil
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

    def invalid?(word)
      unless @before_word
        @before_word = word
        return nil
      end

      result = last_char(@before_word) == first_char(word)
      @before_word = word
      result ? nil : ShiritoriError.new
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

  def invalid?(word)
    @checkers.map {|checker| checker.invalid?(word) } .find {|error| error }
  end
end
