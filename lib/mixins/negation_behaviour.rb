module NegationBehaviour
  def create_matcher
    NegateMatch.new(super)
  end
end
