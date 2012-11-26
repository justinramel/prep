class IsPublishedBy
  
  def initialize(studio)
    @studio = studio
  end

  def call(item)
    item.studio == @studio
  end
end
