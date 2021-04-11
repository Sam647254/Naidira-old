require "./spec_helper"
require "../src/word_generator"

include Naidira

describe WordGenerator do
   it "can be initialized" do
      WordGenerator.new
   end
end
