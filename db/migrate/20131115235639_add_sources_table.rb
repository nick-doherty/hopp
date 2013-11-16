class AddSourcesTable < ActiveRecord::Migration
  def change
  	create_table :sources do |t|
  		t.string :source_name
  		t.string :source_type
  		t.timestamps
  	end
  end
end
