class Airline < ActiveRecord::Base
	attr_accessible :name, :icao, :twitter_user_id, :twitter_screen_name, :call_sign

	has_many :tweet, :foreign_key => "twitter_user_id", :primary_key => "twitter_user_id"
	has_many :flights

	def latest_tweet
		self.tweets.last
	end

end