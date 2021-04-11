require "option_parser"
require "./naidira"

include Naidira

word_generator = WordGenerator.new

OptionParser.parse do |parser|
  parser.banner = "Naidira CLI #{VERSION}"

  parser.on("noun", "Generate a random noun") do
    puts word_generator.noun
  end
end
