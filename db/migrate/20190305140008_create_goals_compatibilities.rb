class CreateGoalsCompatibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :goals_compatibilities do |t|
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
