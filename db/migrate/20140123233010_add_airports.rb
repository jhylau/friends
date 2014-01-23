class AddAirports < ActiveRecord::Migration
    def change
	  	create_table :airports do |t|
	  		t.string :icao
	  		t.string :iata
	  		t.string :name
		    t.string :province
		    t.string :city
		    t.string :classification
	  	end
	end
end
