class Tournament < ActiveRecord::Base
  belongs_to :tournament_type
  validates :name, :presence => true
end