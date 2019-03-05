class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :picture

      t.references :users, foreign_key: true
      t.timestamps
    end
  end
end
