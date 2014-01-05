class FlightsController < ApplicationController
	def index
		@flights = []
		@flights << FlightSearch.new(:departure_time => "2:15pm", :arrival_time => "3:15pm", :price=>"$120", :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure_time => "3:15pm", :arrival_time => "4:15pm", :price=>"$122", :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure_time => "4:15pm", :arrival_time => "5:15pm", :price=>"$126", :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure_time => "5:15pm", :arrival_time => "6:15pm", :price=>"$123", :airline=>"CebuPacificAir", :duration=>"1hr")
	end

	def create
		redirect_to flights_path
	end
end