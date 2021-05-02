require "./spec_helper"
require "../src/word_generator"

include Naidira

describe WordGenerator do
  it "generates valid nouns" do
    generator = WordGenerator.new(0)

    10.times do
      noun = generator.noun
      Decomposer.type_of(noun).should eq(WordType::Noun)
    end
  end

  it "generates vaild verbs" do
    generator = WordGenerator.new(1)

    10.times do
      verb = generator.verb
      Decomposer.type_of(verb).should eq(WordType::Verb)
    end
  end
end
