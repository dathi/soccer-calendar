require 'rails_helper'

RSpec.describe Match, :type => :model do
  it ("has a valid factory") { expect(build(:match)).to be_valid }
  let(:inst) { build(:match) }

  describe "ActiveModel validations" do
  	it "is invalid without a happen_time" do
  	  expect(build(:match, :happen_time => nil)).not_to be_valid
    end
    it "is invalid without a home" do
   	  expect(build(:match, :home => nil)).not_to be_valid
    end
    it "is invalid without a guest" do
      expect(build(:match, :guest => nil)).not_to be_valid
    end
    it "has not happened yet" do
  	  expect(build(:match, :has_not_happened_yet).score).to match("? - ?")
    end
    it "has happened yet" do
  	  expect(build(:match, :has_happened).score).to match("3 - 2")
    end
  end

  describe "ActiveRecord associations" do
  	it { expect(inst).to have_many(:teams) }
    it { expect(inst).to belong_to(:tournament) }
  end
end