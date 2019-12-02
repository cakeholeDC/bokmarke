class CreateReaders < ActiveRecord::Migration[6.0]
  def change
    create_table :readers do |t|
      t.string :name
      t.text :bio
      t.integer :age
      t.integer :fav_author
      t.integer :fav_book
      t.string :username

      t.timestamps
    end
  end
end
