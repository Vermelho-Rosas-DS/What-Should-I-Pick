class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.integer :champion_key
      t.float :win_rate
      t.float :pick_rate
      t.integer :feedback_score, default: nil
      t.text :feedback_text

      t.timestamps
    end
  end
end
