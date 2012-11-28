require 'matcher'

class BlockMatch
  include Matcher

  def initialize(&block)
    @condition = block
  end

  def matches(item)
    @condition.call(item)
  end
  
end
