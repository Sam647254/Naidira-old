require "./constants"

include Naidira::Constants

module Naidira
  class WordGenerator
    property random : Random

    def initialize(seed : UInt64 | Nil = nil)
      @random = seed.nil? ? Random.new : Random.new(seed)
    end

    def noun : String
      generate_word(NOUN_F1_VOWELS, NOUN_F1_CONSONANTS)
    end

    def verb : String
      generate_word(VERB_F1_VOWELS, VERB_F1_CONSONANTS)
    end

    private def generate_word(first_vowels : Array(Char), first_consonants : Array(Char)) : String
      consonant1 = first_consonants[@random.rand(0..first_consonants.size - 1)]
      vowel1 = first_vowels[@random.rand(0..first_vowels.size - 1)]

      next_syllable_chance = 1.0
      has_diphthong = false
      syllables = ["#{consonant1}#{vowel1}"]
      loop do
        continue = random.rand
        break unless continue < next_syllable_chance

        vowel = VOWELS[@random.rand(0..(has_diphthong ? 4 : VOWELS.size - 1))]

        if vowel.ascii_uppercase?
          has_diphthong = true
        end

        consonant = CONSONANTS[@random.rand(0..CONSONANTS.size - 1)]

        syllables << "#{consonant}#{vowel}"

        next_syllable_chance *= 0.4
      end

      return syllables.join
    end
  end
end
