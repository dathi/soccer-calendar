module API
  module V1
  	class Matches < Grape::API
  	  resources :matches do
  	  	desc "Return list of matches"
  	  	get do
          ## use database
          #Match.all

          # call to livescore directly
          doc = ApplicationHelper.parse_url('http://www.livescore.com/soccer/england/premier-league/')
          Match.parse(doc)
  	  	end
  	  end
  	end
  end
end