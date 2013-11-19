class UpdateContentColumn < ActiveRecord::Migration
  def change
    add_column :content, :html, :text
  end
end
