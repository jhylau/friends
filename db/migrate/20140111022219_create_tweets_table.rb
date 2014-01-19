class CreateTweetsTable < ActiveRecord::Migration
  def change
  	create_table :tweets do |t|
  		t.string :content
  		t.integer :tweet_id, :limit => 8
  		t.integer :twitter_user_id
  	end
  end
end
