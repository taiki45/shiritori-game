class WordRepository
  def initialize
    @word_cache = {}
  end

  def contain?(raw_word)
    page = WikiPedia.find(raw_word)
    return false unless page.content

    @word_cache[raw_word] = Word.new(raw_word, page.title)
    true
  end

  def resolve(raw_word)
    return @word_cache[raw_word] if @word_cache.has_key? raw_word

    page = WikiPedia.find(word.origin)
    raise NotFoundError.new("word not found: #{raw_word}") unless page.content

    @word_cache[word.origin] = Word.new(word.origin, page.title)
  end
end
