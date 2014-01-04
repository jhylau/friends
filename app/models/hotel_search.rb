class FlightSearch < ActiveRecord::Base
	attr_accessor :departure_time, :arrival_time, :price, :airline, :duration
	attr_accessible :departure_time, :arrival_time, :price, :airline, :duration
end