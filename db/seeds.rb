# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


users = ['flypal', 'cebupacificair', 'tigerair', 'airasiaph']
client = TwitterIntegration.rest_client

def rate_limit_timeline(client,user)
	max_attempts = 3
	num_attempts = 0
	begin
	  num_attempts += 1
	  timeline = client.user_timeline(user)
	rescue Twitter::Error::TooManyRequests => error
	  if num_attempts <= MAX_ATTEMPTS
	    # NOTE: Your process could go to sleep for up to 15 minutes but if you
	    # retry any sooner, it will almost certainly fail with the same exception.
	    sleep error.rate_limit.reset_in
	    retry
	  else
	    raise
	  end
	end
end

flypal = rate_limit_timeline(client,'flypal').first
cebupacificair = rate_limit_timeline(client,"cebupacificair").first
tigerair = rate_limit_timeline(client,"tigerair").first
airasiazest = rate_limit_timeline(client,"airasiaph").first

users.each do |u|
	Tweet.create!(:content => eval(u).text, :screen_name => eval(u).user.name, :tweet_id => eval(u).id, :twitter_user_id => eval(u).user.id)
end