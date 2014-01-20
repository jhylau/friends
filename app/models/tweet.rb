class Tweet < ActiveRecord::Base
  attr_accessible :text, :tweet_id, :twitter_user_id

  belongs_to :airline

  FLYPAL = 54149214
  TIGERAIRPH = 1545718316
  CEBUPACIFICAIR = 62452990
  AIRASIAPH = 358100624

  def self.pull_tweets
  	# daemon = TweetStream::Daemon.new('tracker', :log_output => true)
  	# daemon.on_inited do
  	#   ActiveRecord::Base.connection.reconnect!
  	#   # ActiveRecord::Base.logger = Logger.new(File.open('log/stream.log', 'w+'))
  	# end
  	# daemon.follow(54149214,1545718316,62452990) do |tweet|
  	#     create!(
  	#   	  tweet_id: tweet.id,
   #        content: tweet.text,
   #        screen_name: tweet.user.screen_name,
   #        :twitter_user_id: tweet.user.id
  	#   	)
  	# end
  end

  def self.latest_results(twitter_user_id)
    self.where(:twitter_user_id => twitter_user_id).last
  end

  def self.all_results(twitter_user_id)
    self.where(:twitter_user_id => twitter_user_id)
  end
end


#http://stackoverflow.com/questions/20727078/tweetstream-foreman-not-working-until-killed
#54149214 flyPAL, 1545718316 tigerairph, 62452990 cebu pacific air, 