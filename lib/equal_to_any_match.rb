require 'matcher'

class EqualToAnyMatch
  include Matcher
  def initialize(*values)
    @values = values
  end
  def matches(item)
    @values.include?(item)
  end
end
