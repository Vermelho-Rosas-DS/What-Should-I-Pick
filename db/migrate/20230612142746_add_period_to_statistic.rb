class AddPeriodToStatistic < ActiveRecord::Migration[7.0]
  def change
    add_column :statistics, :period, :string
  end
end
