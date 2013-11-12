class CreateTimeControls < ActiveRecord::Migration
  def change
    create_table :time_controls do |t|
      t.integer :book_id
      t.integer :started_time
      t.integer :end_time
      t.boolean :is_time_included

      t.timestamps
    end
  end
end
