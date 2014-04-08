class CreateCharacterItems < ActiveRecord::Migration
  def change
    create_table :character_items do |t|
      t.integer :character_id
      t.integer :default_item_id
      t.integer :value

      t.timestamps
    end
  end
end
