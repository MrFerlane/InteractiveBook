class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.integer :act_id
      t.string :source_class
      t.string :source_name
      t.string :change_class
      t.string :change_way
      t.integer :value

      t.timestamps
    end
  end
end
