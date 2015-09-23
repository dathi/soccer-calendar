require "rails_helper"

RSpec.describe "Web API", :type => :api do
  describe "tournaments api" do
  	it "return a 200 HTTP Status" do
  	  get "/api/v1/tournaments", format: :json
  	  expect(response).to have_http_status(200)
  	end
  end
end