class CreateRating < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :value, null: false
      t.references :film, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
