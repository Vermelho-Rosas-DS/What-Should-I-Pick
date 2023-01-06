class AddChampionReferenceToStatistic < ActiveRecord::Migration[7.0]
  def change
    add_reference :statistics, :champion, foreign_key: true
  end
end
