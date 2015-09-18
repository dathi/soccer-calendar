class Team < ActiveRecord::Base
  belongs_to :match
  validates :name, :played_number, :rank, :points, :presence => true
end
