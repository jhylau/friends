module TweetViewHelper
	def flypal_latest
		Tweet.latest_results(Tweet::FLYPAL)
	end

	def flypal_tweets
		Tweet.all_results(Tweet::FLYPAL)
	end

	def cebupacificair_tweets
		Tweet.all_results(Tweet::CEBUPACIFICAIR)
	end

	def cebupacificair_latest
		Tweet.latest_results(Tweet::CEBUPACIFICAIR)
	end

	def tigerairph_tweets
		Tweet.all_results(Tweet::TIGERAIRPH)
	end

	def tigerairph_latest
		Tweet.latest_results(Tweet::TIGERAIRPH)
	end

	def airasiaph_tweets
		Tweet.all_results(Tweet::AIRASIAPH)
	end

	def airasiaph_latest
		Tweet.latest_results(Tweet::AIRASIAPH)
	end
end