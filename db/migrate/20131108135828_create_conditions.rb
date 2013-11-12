class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :act_id
      t.string :source_class
      t.string :source_name
      t.string :condition_class
      t.integer :value

      t.timestamps
    end
  end
end
