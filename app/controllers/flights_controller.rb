class FlightsController < ApplicationController
	def index
		@flights = []
		@flights << Flight.new(:departure => DateTime.httpdate('Sat, 03 Feb 2001 04:05:06 GMT'), :arrival => DateTime.httpdate('Sat, 03 Feb 2001 04:05:06 GMT'), :price=>120, :airline_id=>1, :duration=>1)
	end

	def create
		redirect_to flights_path
	end
end