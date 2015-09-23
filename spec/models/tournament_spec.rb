require "rails_helper"

RSpec.describe Tournament, :type => :model do
  let(:inst) { build(:tournament) }
  it ("has a valid factory") { expect(build(:tournament)).to be_valid }

  describe "ActiveRecord Validation" do
  	it ("is invalid without name") { expect(build(:tournament, :name => nil)).not_to be_valid }
  end

  describe "ActiveRecord Association" do
  	it { expect(inst).to belong_to(:tournament_type) }
  	it { expect(inst).to have_many(:matches) }
  end

  describe "test api" do
  	before { get "/v1/tournaments", format: :json }
  	it "response code" do
  	  expect(response).to have_http_status(200)
  	end
  end
end