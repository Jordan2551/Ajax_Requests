class AddCityToStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :city, foreign_key: true
  end
end
