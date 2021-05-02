require "./spec_helper"
require "../src/decomposer"

include Naidira

describe Decomposer do
  it "correctly splits words into syllables" do
    tests = [
      {"naidira", ["nA", "di", "ra"]},
      {"ruma", ["ru", "ma"]},
      {"terai", ["te", "rA"]},
      {"luina", ["lU", "na"]},
    ]

    tests.each do |word|
      word, syllables = word
      Decomposer.split_into_syllables(word).should eq(syllables)
    end
  end
end
