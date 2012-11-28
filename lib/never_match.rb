require 'matcher'

class NeverMatch
  include Matcher
  
  def matches(item)
    false
  end
end
