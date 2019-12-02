class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.references :reader, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
