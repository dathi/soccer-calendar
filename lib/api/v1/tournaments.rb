module API
  module V1
  	class Match < Grape::API
  	  version 'v1'
  	  format :json

  	  resources :matches do
  	  	desc "Return list of matches"
  	  	get do
  	  	  Match.all
  	  	end
  	  end
  	end
  end
end