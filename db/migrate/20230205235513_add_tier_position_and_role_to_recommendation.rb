class AddTierPositionAndRoleToRecommendation < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :tier, :string
    add_column :recommendations, :position, :string
    add_column :recommendations, :role, :string
  end
end
