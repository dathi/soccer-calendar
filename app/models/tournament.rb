class Tournament < ActiveRecord::Base
  belongs_to :tournament_type
  has_many :matches
  validates :name, :presence => true

  def self.parse(doc)
  	tournament = doc.css("div.row-tall div.left").text.strip
  	Tournament.find_by_name(tournament)
  end
end