class AddColumnMetricToUserTechnical < ActiveRecord::Migration[5.2]
  def change
    add_column :user_technicals, :metric, :integer
  end
end
