class AddForeignKeyToChampionKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :recommendations, :champions, column: :champion_key, primary_key: "key"
  end
end
