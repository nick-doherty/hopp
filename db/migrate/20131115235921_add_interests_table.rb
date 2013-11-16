class AddInterestsTable < ActiveRecord::Migration
  def change
  	create_table :interests do |t|
  		t.integer :user_id
  		t.string :interest_name
  		t.integer :source_id
  		t.timestamps
  	end
  end
end