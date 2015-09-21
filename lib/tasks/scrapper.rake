require 'nokogiri'
require 'open-uri'

namespace :extractor do
  desc "Extract data from livescore.com"
  task :run => :environment do
  	#parse_url('http://www.livescore.com/soccer/champions-league/group-a/')
    parse_url('http://www.livescore.com/soccer/england/premier-league/')
  end

  def parse_url(url)
  	html = open(url) { |f| f.read }
  	doc = Nokogiri::XML(html)
  	i = 0
  	array = []
#  	rows = doc.xpath("//div[@class='content']/*")
#  	rows.each_with_index do |row, index|
#  	  array << index if row['class'] == 'row row-tall mt4'
#  	end
#  	#puts array[0]
#  	rows[array[0]+1..array[1]-1].each do |m|
#  	#  puts m.css('div.tright').text
#  	end
#  	#puts array[1]
#  	rows[array[1]+1..array[2]-1].each do |m|
#  	#  puts m.css('div.tright').text
 # 	end

  	tournaments = doc.css("div.row-tall > div.left strong")
    matches = []
    Match.delete_all
  	doc.css("div[data-type='evt']").each do |match|
  	  i = i + 1
    	puts "#{i}|#{match.attr('data-esd')}|#{match.css('div.min').text.strip}|#{match.css('div.ply.name').text.strip}|#{match.css('div.sco > a.scorelink').text.strip}"
      home_guest = match.css('div.ply.name').text.strip.split('  ')
      matches << Match.create(:happen_time => match.attr('data-esd'),
                              :home => home_guest[0],
                              :guest => home_guest[1],
                              :score => match.css('div.sco > a.scorelink').text.strip)
  	end
    puts matches.to_json
  end
end