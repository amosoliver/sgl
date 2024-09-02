class AddTrimestreAndAnoToEntradas < ActiveRecord::Migration[7.1]
  def change
    add_column :entradas, :trimestre, :integer
    add_column :entradas, :ano, :integer
  end
end
