module API
  class Root < Grape::API
  	mount API::V1::Tournaments
  	mount API::V1::Matches
  	mount API::V1::Teams
  end
end