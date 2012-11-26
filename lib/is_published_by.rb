class IsPublishedBy
  
  def initialize(studio)
    @studio = studio
  end

  def call(item)
    @item == studio
  end
end
