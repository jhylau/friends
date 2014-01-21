class Flight < ActiveRecord::Base
	attr_accessible :departure, :arrival, :price, :airline_id, :duration

	belongs_to :airline
end