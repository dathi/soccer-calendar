class Match < ActiveRecord::Base
  belongs_to :tournament
  validates :happen_time, :home, :guest, :presence => true

  def self.parse(doc)
  	Match.delete_all # clear table

  	t = Tournament.parse(doc)
  	matches = []
    i = 1

    doc.css("div[data-type='evt']").each do |match|
      home_guest = match.css('div.ply.name').text.strip.split('  ')
      scorelink = match.css('div.sco > a.scorelink')
      if scorelink.text.strip.blank?
        score = match.css('div.sco').text.strip
        detail_url = ""
      else
        score = scorelink.text.strip
        detail_url = scorelink.attr('href').text.strip
      end
      score = scorelink.text.strip.presence || match.css('div.sco').text.strip
      matches << Match.new(:id => i,
                           :happen_time => match.attr('data-esd'),
                           :home => home_guest[0],
                           :guest => home_guest[1],
                           :score => score,
                           :detail_url => detail_url,
                           :tournament => t)
      i = i.next
    end
    matches
  end
end
