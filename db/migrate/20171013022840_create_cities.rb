class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :temp
      t.integer :temp_max
      t.integer :temp_min

      t.timestamps
    end
  end
end
