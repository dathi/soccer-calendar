require "rails_helper"

RSpec.describe Tournament, :type => :model do
  let(:inst) { build(:tournament) }
  it ("has a valid factory") { expect(build(:tournament)).to be_valid }

  describe "ActiveRecord Validation" do
  	it ("is invalid without name") { expect(build(:tournament, :name => nil)).not_to be_valid }
  end

  describe "ActiveRecord Association" do
  	it { expect(inst).to belong_to(:tournament_type) }
  end
end