require "rails_helper"

RSpec.describe "Web API" do
  let(:tournament) { build(:tournament) }
  let(:match) { build(:match) }

  context "GET /api/v1/tournaments" do
    before { get "/api/v1/tournaments" }

  	it "return a 200 HTTP Status" do
  	  expect(response.status).to eq(200)
  	end

    it "return a response in json type" do
      expect(response.header['Content-Type']).to eq('application/json')
    end

  	it "return a valid json response" do
      resp = JSON.parse(response.body)
      nha = false
      resp.each { |m| nha = true if m['name'] == tournament.name }
  	  expect(nha).to eq true
  	end

    it "return a valid json response with valid keys" do
      resp = JSON.parse(response.body)
      resp.each do |t|
        expect(t.keys).to eq(["id", "name", "tournament_type_id"])
      end
    end

    it "return a response in xml type" do
      get "/api/v1/tournaments.xml"
      expect(response.header["Content-Type"]).to eq("application/xml")
    end
  end

  context "GET /api/v1/matches" do
    before { get "/api/v1/matches" }

    it "return a valid status code" do
      expect(response.status).to eq(200)
    end

    it "return a valid response as json" do
      expect(response.header["Content-Type"]).to eq("application/json")
    end

    it "return a valid json response with valid keys" do
      resp = JSON.parse(response.body)
      resp.each do |m|
        expect(m.keys).to eq(["id", "home", "guest", "happen_time", "score", "tournament_id"])
      end
    end
  end

  context "GET /api/v1/teams" do
    before { get "/api/v1/teams" }

    it "return a response with status 200" do
      expect(response.status).to eq 200
    end

    it "return a valid response as json" do
      expect(response.header["Content-Type"]).to eq "application/json"
    end

    it "return a valid json response with valid keys" do
      resp = JSON.parse(response.body)
      resp.each do |t|
        expect(t.keys).to eq ["id", "name", "played_number", "rank", "points", "wins", "draws", "losts", "goals_for", "goals_against", "goals_difference"]
      end
    end
  end
end