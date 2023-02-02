class AddIndexOnChampionKeyOnRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_index :recommendations, :champion_key
  end
end
