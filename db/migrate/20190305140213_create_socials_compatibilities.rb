class CreateSocialsCompatibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :socials_compatibilities do |t|
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
