require 'kernel_extensions'
require 'negation_behaviour'
require 'match_creation'

class Where
  include MatchCreation

  attr_reader :field

  def initialize(field)
    @field = field
  end

  def self.item(field)
    new field
  end
end
