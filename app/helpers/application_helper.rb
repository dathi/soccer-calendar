require 'open-uri'

module ApplicationHelper
  def self.parse_url(url)
  	html = open(url) { |f| f.read }
  	Nokogiri::XML(html)
  end
end
