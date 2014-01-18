class FlightsController < ApplicationController
	def index
		@flights = []
		@flights << FlightSearch.new(:departure => Date.new(2013,11,5), :arrival => "3:15pm", :price=>120, :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure => "3:15pm", :arrival => "4:15pm", :price=>122, :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure => "4:15pm", :arrival=> "5:15pm", :price=>126, :airline=>"CebuPacificAir", :duration=>"1hr")
		@flights << FlightSearch.new(:departure => "5:15pm", :arrival => "6:15pm", :price=>123, :airline=>"CebuPacificAir", :duration=>"1hr")
	end

	def create
		redirect_to flights_path
	end
end