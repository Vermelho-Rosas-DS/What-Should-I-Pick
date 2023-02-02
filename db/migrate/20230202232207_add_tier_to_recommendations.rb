class AddTierToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :tier, :string
  end
end
