module API
  module V1
  	class Tournaments < Grape::API
  	  resources :tournaments do
  	  	desc "Return list of tournaments"
  	  	get do
  	  	  Tournament.all
  	  	end
  	  end
  	end
  end
end