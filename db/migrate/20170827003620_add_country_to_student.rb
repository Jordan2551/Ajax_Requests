class AddCountryToStudent < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :country, foreign_key: true
  end
end
