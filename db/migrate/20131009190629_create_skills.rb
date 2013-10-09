class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :skill_name, null: false
      t.integer :skillable_id, null: false
      t.string :skillable_type, null: false

      t.timestamps
    end
  end
end
