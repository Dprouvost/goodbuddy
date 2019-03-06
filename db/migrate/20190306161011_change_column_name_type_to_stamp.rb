class ChangeColumnNameTypeToStamp < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :type, :stamp
  end
end
