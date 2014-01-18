class InfiniteList
  include Enumerable

  def self.from_array(arr)
    new(arr)
  end

  def initialize(arr)
    @arr = arr
  end

  def each
    loop do
      @arr.each {|e| yield e }
    end
  end
end
