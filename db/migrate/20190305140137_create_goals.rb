class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :code
      t.string :label
      t.references :goals_compatibilities, foreign_key: true

      t.timestamps
    end
  end
end
