class FlightsController < ApplicationController
	def index
		@flights = Flight.where(:id => 1)
		respond_to do |format|
	      format.html
	      format.json do
	        if params[:datatable]
	          render(
	            :json => RemoteDatatable.new(
	              view_context, @flights, 
	              :flight_row, ["flights.airline_id", "flights.departure", "flights.arrival", "flights.price", "flights.duration"]
	            )
	          )
	        end
	      end
	    end
	end

	def create
		redirect_to flights_path
	end
end