require "option_parser"
require "./naidira"

include Naidira

word_generator = WordGenerator.new

OptionParser.parse do |parser|
  parser.banner = "Naidira CLI #{VERSION}"

  parser.on("noun", "Generate a random noun") do
    puts word_generator.noun
  end

  parser.on("verb", "Generate a random verb") do
    puts word_generator.verb
  end

  parser.on("-c WORD", "--check=WORD", "Check the word type of a given word") do |input|
    puts Decomposer.type_of(input)
  end
end
