require 'composite_comparer'
module ComparisonBehaviours
  def call(x,y)
    self.compare(x,y)
  end
  def then_by(field)
    CompositeComparer.new(self, SymbolicComparer.new(field))
  end
end
