require 'symbolic_comparer'
require 'reverse_comparer'
require 'ranked_comparer'
class Sort
  def self.by(field, *args)
    args.length == 0 ?  SymbolicComparer.new(field) : SymbolicComparer.new(field, RankedComparer.new(args))
  end
  def self.by_descending(field)
    ReverseComparer.new(by(field))
  end
end
