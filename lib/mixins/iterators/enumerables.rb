module Enumerables
  def all_items_matching(specification = nil ,&block)
    condition = block_given? ? block : specification

    Enumerator.new do |yielder|
      each do|item|
        yielder.yield(item) if condition.call(item)
      end
    end
  end

  def sort_using(comparison = nil, &block)
    comparer = block_given? ? block : comparison
    each.to_a.sort {|x,y| comparer.call(x,y)}
  end

end
