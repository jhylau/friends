class CreateFlightSearches < ActiveRecord::Migration
  def change
  	create_table :flight_searches do |t|
  		t.date :departure
  		t.date :arrival
  		t.date :flight_start
  		t.date :flight_end
      t.integer :duration
      t.integer :price
  		t.integer :adults
  		t.integer :children
  		t.integer :infants
  	end
  end
end
