module Enumerables
  def all_items_matching(specification = nil ,&block)
    condition = block_given? ? block : specification
    results = []
    self.each do|item|
      results.push(item) if condition.call(item)
    end
    results
  end

  def sort_all_items_by(comparison = nil, &block)
    comparer = block_given? ? block : comparison
    all.sort do |x, y|
      comparer.call(x, y)
    end
  end

end
