class Sort
  def self.by_descending(field)
    ReverseComparer.new(SymbolicComparer.new(field,DefaultComparer.new))
  end
end
