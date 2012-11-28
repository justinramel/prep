require 'default_comparer'
require 'reverse_comparer'
require 'symbolic_comparer'
require 'then_by_comparer'

class Sort
  def self.by(field, *sort_list)
    ThenByComparer.new(SymbolicComparer.new(field,DefaultComparer.new))
  end

  def self.by_descending(field)
    ReverseComparer.new(SymbolicComparer.new(field,DefaultComparer.new))
  end
end
