class AddPositionToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :position, :string
  end
end
