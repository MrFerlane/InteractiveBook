class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :book_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
