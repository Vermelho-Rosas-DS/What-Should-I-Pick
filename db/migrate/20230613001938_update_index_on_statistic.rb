class UpdateIndexOnStatistic < ActiveRecord::Migration[7.0]
  def up
    remove_index :statistics, name: :index_unique_statistic_for_champion
    add_index :statistics, [:tier, :position, :region, :champion_id, :period], unique: true, name: 'index_unique_statistic_for_champion'
  end

  def down
    remove_index :statistics, name: :index_unique_statistic_for_champion
    add_index :statistics, [:tier, :position, :region, :champion_id, :period], unique: true, name: 'index_unique_statistic_for_champion'
  end
end
