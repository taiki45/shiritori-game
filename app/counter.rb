class Counter
  attr_reader :current

  def initialize
    @current = 0
    @max = 0
  end

  def zero_orig
    @current - 1
  end

  def add
    @max += 1
  end

  def next
    if @current >= @max
      @current = 1
    else
      @current += 1
    end
  end
end
