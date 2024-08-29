class CreateLiteraturas < ActiveRecord::Migration[7.1]
  def change
    create_table :literaturas do |t|
      t.decimal :valor
      t.references :congregacao, null: false, foreign_key: true
      t.integer :trimestre
      t.integer :ano

      t.timestamps
    end
  end
end
