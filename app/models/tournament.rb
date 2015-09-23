class Tournament < ActiveRecord::Base
  belongs_to :tournament_type
  has_many :matches
  validates :name, :presence => true
end