require 'rails_helper'

RSpec.describe Team, :type => :model do
  it ("has a valid factory") { expect(build(:team)).to be_valid }
  let(:inst) { build(:team) }

  describe "ActiveModel validations" do
  	it ("is invalid without name") { expect(build(:team, :name => nil)).not_to be_valid }
  	it ("is invalid without points") { expect(build(:team, :points => nil)).not_to be_valid }
  	it ("is invalid without played_number") { expect(build(:team, :played_number => nil)).not_to be_valid }
  	it ("is invalid without rank") { expect(build(:team, :rank => nil)).not_to be_valid }
  end

  describe "ActiveRecord associations" do
  	
  end
end