class IsPublishedBy
  include Matcher  

  def initialize(studio)
    @studio = studio
  end

  def matches(item)
    item.studio == @studio
  end
end
