class AddIndexToQueriesByHour < ActiveRecord::Migration
  def change
    add_index :queries, :hour
  end
end
