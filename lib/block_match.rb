require 'matcher'

class BlockMatch
  include Matcher

  def initialize(negate, &block)
    @condition = block
    @negate = negate
  end

  def matches(item)
    if @negate
      !@condition.call(item)
    else
      @condition.call(item)
    end
  end

end
