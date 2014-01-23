class Airport < ActiveRecord::Base
	attr_accessible :city, :province, :iata, :icao, :name, :classification
end