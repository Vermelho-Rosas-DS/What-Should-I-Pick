class CreateStatistics < ActiveRecord::Migration[7.0]
  def change
    create_table :statistics do |t|
      t.integer :tier
      t.integer :position
      t.float :win_rate
      t.float :pick_rate
      t.float :performance
      t.string :role
      t.string :secondary_role
      t.integer :kill
      t.integer :death
      t.integer :assist
      t.integer :region
      t.integer :champion_key

      t.timestamps
    end
  end
end
