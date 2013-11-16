class AddContentTable < ActiveRecord::Migration
  def change
  	create_table :content do |t|
  		t.integer :interest_id
  		t.string :url
  		t.integer :duration
  		t.timestamps
  	end
  end
end
