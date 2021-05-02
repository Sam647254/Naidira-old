module Naidira::Constants
  NOUN_F1_VOWELS     = ['a', 'u', 'E', 'i']
  NOUN_F1_CONSONANTS = ['m', 'n', 'r', 's', 'p', 't', 'k']

  VERB_F1_VOWELS     = ['a', 'e', 'i']
  VERB_F1_CONSONANTS = ['b', 'f', 'd', 'z', 'l', 'g']

  VOWELS      = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'O', 'U']
  MONOPTHONGS = ['a', 'e', 'i', 'o', 'u']
  CONSONANTS  = ['m', 'p', 'b', 'f', 'v', 'n', 't', 'd', 's', 'z', 'r', 'l', 'k', 'g']

  enum WordType
    Noun
    Verb
    ProperNoun
    Particle
    Unknown
  end

  enum LetterType
    Vowel
    Consonant
    Other
  end
end
