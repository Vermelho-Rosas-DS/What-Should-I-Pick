class CreateChampions < ActiveRecord::Migration[7.0]
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :key
      t.string :title
      t.string :title_pt_br
      t.string :title_es
      t.text :blurb
      t.text :blurb_pt_br
      t.text :blurb_es
      t.text :lore
      t.text :lore_pt_br
      t.text :lore_es
      t.integer :difficulty
      t.string :role
      t.string :secondary_role
      t.text :enemy_tips
      t.text :enemy_tips_pt_br
      t.text :enemy_tips_es
      t.text :ally_tips
      t.text :ally_tips_pt_br
      t.text :ally_tips_es
      t.string :name_identifier

      t.timestamps
    end
  end
end
