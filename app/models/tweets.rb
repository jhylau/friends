class Tweets < ActiveRecord::Base
  attr_accessible :content, :screen_name, :tweet_id, :twitter_user_id

  def self.pull_tweets
  	daemon = TweetStream::Daemon.new('tracker', :log_output => true)
	daemon.on_inited do
	  ActiveRecord::Base.connection.reconnect!
	  # ActiveRecord::Base.logger = Logger.new(File.open('log/stream.log', 'w+'))
	end
	daemon.follow(54149214,1545718316,62452990) do |tweet|
	    create!(
	  	   tweet_id: tweet.id,
           content: tweet.text,
           screen_name: tweet.user.screen_name,
           :twitter_user_id: tweet.user.id
	  	)
	end
    # TWITTER_REST_CLIENT.favorites("railscasts").each do |tweet|
    #   unless exists?(tweet_id: tweet.id)
    #     create!(
    #       tweet_id: tweet.id,
    #       content: tweet.text,
    #       screen_name: tweet.user.screen_name,
    #     )
    #   end
    # end
  end
end

#http://stackoverflow.com/questions/20727078/tweetstream-foreman-not-working-until-killed
#54149214 flyPAL, 1545718316 tigerairph, 62452990 cebu pacific air, 