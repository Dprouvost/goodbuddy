class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :users, foreign_key: { to_table: :users }
      t.references :contacts, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
