class AddKeyUniquenessValidationToChampion < ActiveRecord::Migration[7.0]
  def change
    add_index :champions, :key, unique: true
  end
end
