class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :hour
      t.string :category
      t.string :location_country
      t.integer :price_max
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
