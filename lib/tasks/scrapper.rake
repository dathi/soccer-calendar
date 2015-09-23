require 'parser'
include Parser

namespace :extractor do
  desc "Extract data from livescore.com"
  task :run => :environment do
    doc = parse_url('http://www.livescore.com/soccer/england/premier-league/')
    parse_match(doc)
  end
end