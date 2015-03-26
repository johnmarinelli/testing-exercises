class AddAnchorToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :anchor, :timestamp
  end
end
