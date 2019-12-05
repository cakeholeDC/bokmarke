class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.text :content
      t.integer :rating
      t.boolean :recommend

      t.timestamps
    end
  end
end
