require 'rails_helper'

RSpec.describe TournamentType, :type => :model do
  it ("has a valid factory") { expect(build(:tournament_type)).to be_valid }
  let(:inst) { build(:tournament_type) }

  describe "ActiveRecord Validation" do
  	it ("is invalid without name") { expect(build(:tournament_type, :name => nil)).not_to be_valid }
  end

  describe "ActiveRecord Asssociation" do
    it { expect(inst).to have_many(:tournaments) }
  end
end