require 'matcher'
class SymbolicMatch
  include Matcher

  def initialize(field_name,value_matcher)
    @field_name = field_name
    @value_matcher = value_matcher
  end

  def matches(item)
    @value_matcher.matches(item.send(@field_name))
  end
  
end
