class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :linkedin
      t.string :github
      t.string :twitter
      t.string :blog
      t.string :stackoverflow
      t.boolean :relocate

      t.timestamps
    end
  end
end
