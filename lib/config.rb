require "rest-client"
require "json"

class Names
	def initialize(url)
		@url = url
	end

	def query()
		url = "#{@url}"
		response = RestClient.get url
		result = JSON.parse(response.body, :symbolize_names => true)
		return result
	end

end