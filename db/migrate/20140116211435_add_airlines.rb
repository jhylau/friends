class AddAirlines < ActiveRecord::Migration
  def change
  	create_table :airlines do |t|
  		t.string :name
  		t.string :iata
  		t.string :icao
  		t.string :call_sign
  		t.string :twitter_screen_name
  		t.integer :twitter_user_id, :limit => 8
  	end
  end
end
