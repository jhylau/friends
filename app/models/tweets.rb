class Tweets < ActiveRecord::Base
  attr_accessible :content, :screen_name, :tweet_id, :twitter_user_id

  PHIL_AIR = 54149214
  TIGER_AIR = 1545718316
  CEBU_PAC = 62452990
  AIR_ASIA = 1361577234

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

  def airline_latest_results(airline)
      where(:twitter_user_id => airline).last
  end

  def airline_all_results(airline)
      where(:twitter_user_id => airline)
  end
end


#http://stackoverflow.com/questions/20727078/tweetstream-foreman-not-working-until-killed
#54149214 flyPAL, 1545718316 tigerairph, 62452990 cebu pacific air, 