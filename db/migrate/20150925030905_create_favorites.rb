class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :favoer, index: true
      t.references :posted, index: true

      t.timestamps null: false
      
      t.index [:favoer_id, :posted_id]
    end
  end
end
