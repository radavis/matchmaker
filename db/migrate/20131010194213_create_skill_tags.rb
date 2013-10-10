class CreateSkillTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
      t.integer :skill_id
      t.integer :company_id

      t.timestamps
    end
  end
end
