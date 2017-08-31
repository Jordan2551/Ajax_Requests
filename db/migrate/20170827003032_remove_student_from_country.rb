class RemoveStudentFromCountry < ActiveRecord::Migration[5.1]
  def change
    remove_reference :countries, :student, foreign_key: true
  end
end
