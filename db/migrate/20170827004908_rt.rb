class Rt < ActiveRecord::Migration[5.1]
  def change
    drop_table :countries
  end
end
