class HomeController < ApplicationController
	def index
		@flight_search = FlightSearch.new
	end
end