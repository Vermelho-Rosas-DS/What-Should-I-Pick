class AddPreferenceUniquenessValidationToStatistic < ActiveRecord::Migration[7.0]
  def change
    add_index :statistics, [:tier, :position, :region, :champion_id], unique: true, name: 'index_unique_statistic_for_champion'
  end
end