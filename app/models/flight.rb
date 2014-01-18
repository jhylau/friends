class Flight < ActiveRecord::Base
	attr_accessible :departure, :arrival, :price, :airline_id, :duration, :departure_time, :arrival_time

end