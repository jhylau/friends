def collect_with_max_id(collection=[], max_id=nil, &block)
	response = yield max_id
	collection += response
	response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def get_all_tweets(user, client, count=200)
	collect_with_max_id do |max_id|
	  options = {:count => count, :include_rts => true}
	  options[:max_id] = max_id unless max_id.nil?
	  client.user_timeline(user, options)
	end
end

def rate_limit_timeline(client,user)
	max_attempts = 3
	num_attempts = 0
	begin
	  num_attempts += 1
	  retweets = client.user_timeline(user)
	rescue Twitter::Error::TooManyRequests => error
	  if num_attempts <= max_attempts
	    # NOTE: Your process could go to sleep for up to 15 minutes but if you
	    # retry any sooner, it will almost certainly fail with the same exception.
	    sleep error.rate_limit.reset_in
	    retry
	  else
	    raise
	  end
	end
end
