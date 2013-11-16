class AddBookmarksTable < ActiveRecord::Migration
   def change
  	create_table :bookmarks do |t|
  		t.integer :use_id
  		t.string :url
  		t.timestamps
  	end
  end
end