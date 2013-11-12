class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.integer :page_id
      t.string :description
      t.integer :success_page
      t.integer :fail_page
      t.integer :time_fail_page
      t.integer :required_time

      t.timestamps
    end
  end
end
