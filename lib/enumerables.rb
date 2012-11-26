module Enumerables
  def all_items_matching(specification = nil)
    condition = block_given? ? block : specification
    all.find_all do|item|
      condition.call(item)
    end
  end
end