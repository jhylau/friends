class FlightSearchesController < ApplicationController
	def index
		@flight_search = FlightSearch.new
		# @tweets << Tweet.where(:twitter_user_id => Tweet::FLYPAL).last.text
		# @tweets << Tweet.where(:twitter_user_id => Tweet::CEBUPACIFICAIR).last.text
		# @tweets << Tweet.where(:twitter_user_id => Tweet::AIRASIAPH).last.text
		# @tweets << Tweet.where(:twitter_user_id => Tweet::TIGERAIR).last.text
		@latest_tweets = Tweet.all
	end

	def create
		@flight_search = FlightSearch.new(params[:flight_search])
		if @flight_search.save 
			redirect_to flights_path
		else
      		render :action => "index"
    	end
	end
end