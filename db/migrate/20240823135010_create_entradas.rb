class CreateEntradas < ActiveRecord::Migration[7.1]
  def change
    create_table :entradas do |t|
      t.references :congregacao, null: false, foreign_key: true
      t.decimal :valor
      t.timestamps
    end
  end
end
