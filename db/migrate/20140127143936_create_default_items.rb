class CreateDefaultItems < ActiveRecord::Migration
  def change
    create_table :default_items do |t|
      t.integer :book_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
