class AddAiTipsToChampion < ActiveRecord::Migration[7.0]
  def change
    add_column :champions, :ai_tips, :text
  end
end
