class Match < ActiveRecord::Base
  has_many :teams
  belongs_to :tournament
  validates :happen_time, :home, :guest, :presence => true

  def self.parse(doc)
  	Match.delete_all # clear table

  	tournament = doc.css("div.row-tall div.left").text.strip
  	t = Tournament.find_by_name(tournament)
  	matches = []
    i = 1

    doc.css("div[data-type='evt']").each do |match|
      puts "#{match.attr('data-esd')}|#{match.css('div.min').text.strip}|#{match.css('div.ply.name').text.strip}|#{match.css('div.sco > a.scorelink').text.strip}"
      home_guest = match.css('div.ply.name').text.strip.split('  ')
      matches << Match.new(:id => i,
                           :happen_time => match.attr('data-esd'),
                           :home => home_guest[0],
                           :guest => home_guest[1],
                           :score => match.css('div.sco > a.scorelink').text.strip,
                           :tournament => t)
      i = i.next
    end
    matches
  end
end
