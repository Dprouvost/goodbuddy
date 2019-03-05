class CreateTechnicalsCompatibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :technicals_compatibilities do |t|
      t.integer :metric
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
