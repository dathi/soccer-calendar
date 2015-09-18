class Match < ActiveRecord::Base
  has_many :teams
  validates :happen_time, :home, :guest, :presence => true
end
