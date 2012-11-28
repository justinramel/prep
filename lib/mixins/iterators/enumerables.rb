module Enumerables
  def all_items_matching(specification = nil ,&block)
    condition = block_given? ? block : specification
    results = []
    self.each do|item|
      results << item if condition.call(item)
    end
    results
  end

  def sort_using(comparison = nil, &block)
    comparer = block_given? ? block : comparison
    each.to_a.sort {|x,y| comparer.call(x,y)}
  end

end
