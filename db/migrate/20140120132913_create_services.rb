class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :code
      t.integer :price

      t.timestamps
    end
  end
end
