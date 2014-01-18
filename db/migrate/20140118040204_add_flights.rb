class AddFlights < ActiveRecord::Migration
  def change
  	create_table :flights do |t|
  		t.date :departure
  		t.date :arrival
  		t.integer :price
	    t.integer :duration
	    t.string :airline_id
  	end
  end
end
