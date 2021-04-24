require "./constants"

include Naidira::Constants

module Naidira::Decomposer
  extend self

  class ClusterException < Exception
    property cluster : String, word : String

    def initialize(@cluster : String, @word : String)
    end

    def message
      "Invalid letter cluster #{cluster} in #{word}"
    end
  end

  class InvalidInputException < Exception
  end

  def split_into_syllables(input : String) : Array(String)
    position = 0
    consonant = nil
    vowel = nil
    syllables = [] of String

    input.each_char do |ch|
      case letter_type_of(ch)
      when LetterType::Consonant
        if !consonant.nil?
          if !vowel.nil?
            syllables << "#{consonant}#{vowel}"
          else
            raise ClusterException.new("#{consonant}#{ch}}", input)
          end
        else
          consonant = ch
          vowel = nil
        end
      when LetterType::Vowel
        if !vowel.nil?
          case {vowel, ch}
          when {'a', 'i'}, {'e', 'i'}, {'u', 'i'}
            vowel = vowel.upcase
          when {'o', 'u'}
            vowel = 'O'
          end
        else
          vowel = ch
        end
      else
        raise InvalidInputException.new("Cannot decompose #{input}")
      end
    end

    if vowel.nil?
      raise InvalidInputException.new("Dangling final consonant in #{input}")
    end

    syllables << "#{consonant}#{vowel}"
  end

  def type_of(input : String) : WordType
    return WordType::ProperNoun if letter_type_of(input[0]) == LetterType::Other
    syllables = split_into_syllables(input)
    first_syllable = syllables[0]
    if NOUN_F1_CONSONANTS.includes?(first_syllable[0]) && NOUN_F1_VOWELS.includes?(first_syllable[1])
      WordType::Noun
    elsif VERB_F1_CONSONANTS.includes?(first_syllable[0]) && VERB_F1_VOWELS.includes?(first_syllable[1])
      WordType::Verb
    elsif first_syllable[0] == 'v' || syllables.size == 1
      WordType::Particle
    else
      WordType::Unknown
    end
  end

  def letter_type_of(input : Char) : LetterType
    if MONOPTHONGS.includes?(input)
      LetterType::Vowel
    elsif CONSONANTS.includes?(input)
      LetterType::Consonant
    else
      LetterType::Other
    end
  end
end