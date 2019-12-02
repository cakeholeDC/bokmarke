class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :page_count
      t.references :author, null: false, foreign_key: true
      t.string :img
      t.string :category

      t.timestamps
    end
  end
end
