class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :eng
      t.string :spa

      t.timestamps null: false
    end
  end
end
