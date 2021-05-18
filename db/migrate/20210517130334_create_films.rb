class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.string :rating
      t.integer :year
      t.string :genre
      t.string :company
      t.string :producer
      t.string :actors
      t.string :cost
      t.string :image_link

      t.timestamps
    end
  end
end
