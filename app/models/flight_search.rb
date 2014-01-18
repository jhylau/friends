class FlightSearch < ActiveRecord::Base
	attr_accessible :departure, :arrival :price, :airline, :duration

end