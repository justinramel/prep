require 'comparison_behaviours'

class SymbolicComparer
  include ComparisonBehaviours

  def initialize(field,real_comparison)
    @field = field
    @real_comparison = real_comparison
  end

  def compare(x,y)
    @real_comparison.compare(x.send(@field),y.send(@field))
  end
end
