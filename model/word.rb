class Word
  attr_reader :origin, :normal_form

  def initialize(origin, normal_form)
    @origin = origin
    @normal_form = normal_form
  end

  def ==(other)
    return false unless is_a? other.class
    @normal_form == other.normal_form
  end
  alias eql? ==

  def hash
    @normal_form.hash
  end
end
