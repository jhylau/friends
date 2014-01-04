class HotelSearches < ActiveRecord::Migration
    def change
    	create_table :hotel_searches do |t|
	  		t.integer :hotel_id
	  		t.date :start_date
	  		t.date :end_date
	  		t.integer :guests
	  	end
  	end
end
