module MatchCreation
  def create_matcher(match_strategy = NeverMatch.new, &block)
    strategy = block_given? ? BlockMatch.new(&block) : match_strategy

    SymbolicMatch.new(field,strategy)
  end

  def equal_to_any(*values)
    create_matcher {|item| values.include? item}
  end

  def equal_to(value)
    equal_to_any value
  end

  def greater_than(value)
    create_matcher {|item| item > value}
  end

  def between(min, max)
    create_matcher {|item| item >= min && item <= max}
  end

  def not
    item = Where.new(field)
    item.extend(NegationBehaviour)
    item
  end
end
