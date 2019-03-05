class CreateUserTechnicals < ActiveRecord::Migration[5.2]
  def change
    create_table :user_technicals do |t|
      t.references :user, foreign_key: true
      t.references :technical, foreign_key: true

      t.timestamps
    end
  end
end
