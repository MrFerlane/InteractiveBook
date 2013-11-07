class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.integer :character_id
      t.string :name
      t.string :description
      t.integer :count

      t.timestamps
    end
  end
end
