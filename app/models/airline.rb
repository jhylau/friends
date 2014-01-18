class Airline < ActiveRecord::Base
	attr_accessible :name, :iata, :icao, :twitter_user_id, :twitter_screen_name, :call_sign

	has_many :tweets	

	def latest_tweet
		self.tweets.last
	end
end