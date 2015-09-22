class TournamentType < ActiveRecord::Base
  has_many :tournaments
  validates :name, :presence => true
end
