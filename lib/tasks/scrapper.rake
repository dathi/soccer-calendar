namespace :extractor do
  desc "Extract data from livescore.com"
  task :run => :environment do
    doc = ApplicationHelper.parse_url('http://www.livescore.com/soccer/england/premier-league/')
    Match.import Match.parse(doc)
  end
end