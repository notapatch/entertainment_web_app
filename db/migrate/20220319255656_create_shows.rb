class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :category, null: false
      t.integer :rating, null: false
      t.boolean :bookmarked, null: false
      t.boolean :trending, null: false

      t.timestamps
    end
  end
end
