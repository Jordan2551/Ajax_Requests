class RemoveCountryFromStudent < ActiveRecord::Migration[5.1]
  def change
    remove_column :students, :country, :string
  end
end
