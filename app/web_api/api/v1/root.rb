module API
  module V1
    class Root < Grape::API
      version 'v1'
  	  format :json # default is json, the 'format' will remove all default content-types
      content_type :xml, 'application/xml' # re-add support xml after 'format'

  	  mount API::V1::Tournaments
  	  mount API::V1::Matches
  	  mount API::V1::Teams
    end
  end
end