class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :code
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end
