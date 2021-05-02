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

  it "rejects invalid words" do
    tests = ["Ma", "nta", "tae", "ata"]

    tests.each do |word|
      expect_raises(Decomposer::DecomposerException) do
        Decomposer.split_into_syllables(word)
      end
    end
  end
end
