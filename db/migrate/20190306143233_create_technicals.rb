class CreateTechnicals < ActiveRecord::Migration[5.2]
  def change
    create_table :technicals do |t|
      t.integer :profile_id
      t.string :language_1
      t.string :language_2
      t.string :language_3
      t.integer :commit_slot
      t.integer :github_age
      t.integer :number_of_projects
      t.integer :total_commits
      t.integer :followers
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
