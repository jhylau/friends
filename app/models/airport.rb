class Airport < ActiveRecord::Base
	attr_accessible :city, :province, :iata, :icao, :name, :classification

	def city
		read_attribute("city") || ''
	end

	def icao_code
		icao.present? ? " (#{icao.to_s})" : ''
	end

end
