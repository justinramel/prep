module Enumerables
  def all_items_matching(specification = nil ,&block)
    condition = block_given? ? block : specification
    all.find_all do|item|
      condition.call(item)
    end
  end

  def sort_all_items_by(specification = nil, &block)
    condition = block_given? ? block : specification
    all.sort do |x, y|
      condition.call(x, y)
    end
  end

end
