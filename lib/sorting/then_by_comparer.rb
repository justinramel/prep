require 'comparison_behaviours'

class ThenByComparer
  include ComparisonBehaviours

  def initialize(inner)
    @inner = inner
  end

  def then_by(field)
    @then_by = SymbolicComparer.new(field,DefaultComparer.new)
  end

  def compare(x,y)
    if (@then_by)
      if @inner.compare(x,y).zero?
        @then_by.compare(x,y)
      else
        @inner.compare(x,y)
      end
    else
      @inner.compare(x,y)
    end
  end
end
