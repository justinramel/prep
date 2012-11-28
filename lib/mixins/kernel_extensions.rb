module Kernel
  def where(field)
    Where.new(field)
  end
end
