class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :book_id
      t.integer :number
      t.string :text

      t.timestamps
    end
  end
end
