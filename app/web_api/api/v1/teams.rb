module API
  module V1
  	class Teams < Grape::API
  	  resources :teams do
  	  	desc "Get list of teams with all info for each team"
  	  	get do
  	  	  #Team.all

  	  	  doc = ApplicationHelper.parse_url('http://www.livescore.com/soccer/england/premier-league/')
          Team.parse(doc)
  	  	end
  	  end
  	end
  end
end