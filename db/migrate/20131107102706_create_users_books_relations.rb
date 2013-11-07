class CreateUsersBooksRelations < ActiveRecord::Migration
  def change
    create_table :users_books_relations, id: false do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
    end
    add_index :users_books_relations, :user_id
    add_index :users_books_relations, :book_id
  end
end
