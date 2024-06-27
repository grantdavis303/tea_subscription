class CreateTeas < ActiveRecord::Migration[7.1]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.string :temperature
      t.string :brewing_time

      t.timestamps
    end
  end
end
