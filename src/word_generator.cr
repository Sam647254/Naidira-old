module Naidira
  class WordGenerator
    property random : Random

    def initialize(seed : UInt64 | Nil = nil)
      @random = seed.nil? ? Random.new : Random.new(seed)
    end
  end
end
