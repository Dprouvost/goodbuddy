class CreateWeightings < ActiveRecord::Migration[5.2]
  def change
    create_table :weightings do |t|
      t.integer :profile_id
      t.float :social
      t.float :language
      t.float :style
      t.float :experience
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
