class Sort

  attr_reader :field, :proc, :then_by_proc

  def initialize(field, proc = nil, then_by_proc = nil)
    @field = field
    @proc  = proc
    @then_by_proc = then_by_proc
  end

  def call(x,y)
    return proc.call(x,y) if then_by_proc == nil

    if then_by_proc.call(x,y).zero?
      proc.call(x,y)
    else
      then_by_proc.call(x,y)
    end

  end

  def descending
    Sort.new(field, lambda { |x,y| y.send(field) <=> x.send(field) }, then_by_proc)
  end

  def ascending
    Sort.new(field, lambda { |x,y| x.send(field) <=> y.send(field) }, then_by_proc)
  end

  def then_by(field)
    Sort.new(field, nil, self)
  end

  def self.item(field)
    new(field)
  end
end
