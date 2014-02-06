class AddAirports < ActiveRecord::Migration
    def up
	  	create_table :airports do |t|
	  		t.string :icao
	  		t.string :iata
	  		t.string :name
		    t.string :province
		    t.string :city
		    t.string :classification
	  	end
		Rake::Task['database:load_airports'].invoke	
	end

	def down
		drop_table :airports
	end
end
