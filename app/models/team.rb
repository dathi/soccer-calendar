class Team < ActiveRecord::Base
  validates :name, :played_number, :rank, :points, :presence => true

  def self.parse(doc)
  	Team.delete_all

  	i = 0
  	teams = []
  	doc.css('div.ltable').css('div.row-gray').each do |team|
  	  if i == 0 # ignore first element
  	  	i = 1
  	  	next
  	  end
  	  points = team.css("div.pts")
  	  teams << Team.new(:id => i,
  	  					:rank => i,
  	  					:name => team.css('div.team').text.strip,
  	  					:played_number => points[0].text,
  	  					:wins => points[1].text,
  	  					:draws => points[2].text,
  	  					:losts => points[3].text,
  	  					:goals_for => points[4].text,
  	  					:goals_against => points[5].text,
  	  					:goals_difference => points[6].text,
  	  					:points => points[7].text)
  	  i = i.next
  	end
  	teams
  end
end
