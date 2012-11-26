module Matcher
  def or(other)
    CompositeMatch.new(self,other)
  end
  def call(item)
    matches item
  end
end
