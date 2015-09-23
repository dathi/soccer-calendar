require 'nokogiri'
require 'open-uri'

module Parser

  def parse_url(url)
  	html = open(url) { |f| f.read }
  	Nokogiri::XML(html)
#  	array = []
#  	rows = doc.xpath("//div[@class='content']/*")
#  	rows.each_with_index do |row, index|
#  	  array << index if row['class'] == 'row row-tall mt4'
#  	end
  end

  def parse_tournament(doc)
    doc.css("div.row-tall div.left").text.strip
  end

  def parse_match(doc)
    Match.delete_all

    tournament = Tournament.find_by_name(parse_tournament(doc))
    i = 0
    matches = []

    doc.css("div[data-type='evt']").each do |match|
      i = i + 1
      puts "#{i}|#{match.attr('data-esd')}|#{match.css('div.min').text.strip}|#{match.css('div.ply.name').text.strip}|#{match.css('div.sco > a.scorelink').text.strip}"
      home_guest = match.css('div.ply.name').text.strip.split('  ')
      matches << Match.create(:happen_time => match.attr('data-esd'),
                              :home => home_guest[0],
                              :guest => home_guest[1],
                              :score => match.css('div.sco > a.scorelink').text.strip,
                              :tournament => tournament)
    end
    puts matches.to_json
    matches.to_json
  end


end



