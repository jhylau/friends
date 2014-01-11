class CreateTweetsTable < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :content
  		t.string :screen_name
  		t.integer :tweet_id
  		t.integer :twitter_user_id
  	end
  end
end
