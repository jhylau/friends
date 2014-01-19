# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require Rails.root.join('app/helpers','twitter_helper.rb')
include TwitterHelper
users = ['flypal', 'cebupacificair', 'tigerairph', 'airasiaph']

Airline.create!(:name => "Cebu Pacific Air", :icao => "CEB", :iata => "5J", :twitter_user_id => 62452990, :twitter_screen_name => "cebupacificair", :call_sign => "CEBU" )
Airline.create!(:name => "Tigerair Philippines", :icao => "SRQ", :iata => "DG", :twitter_user_id => 1545718316, :twitter_screen_name => "tigerair", :call_sign => "SEA TIGER" )
Airline.create!(:name => "Philippine Airlines", :icao => "", :iata => "", :twitter_user_id => 54149214, :twitter_screen_name => "cebupacificair", :call_sign => "CEBU" )
Airline.create!(:name => "Philippines AirAsia", :icao => "APG", :iata => "PQ", :twitter_user_id => 358100624, :twitter_screen_name => "airasiaph", :call_sign => "ZEST" )


client = TwitterIntegration.rest_client

flypal = rate_limit_timeline(client,'flypal').first
cebupacificair = rate_limit_timeline(client,"cebupacificair").first
tigerairph = rate_limit_timeline(client,"tigerairph").first
airasiaph = rate_limit_timeline(client,"airasiaph").first

users.each do |u|
	Tweet.create!(:text => eval(u).text, :tweet_id => eval(u).id, :twitter_user_id => eval(u).user.id)
end