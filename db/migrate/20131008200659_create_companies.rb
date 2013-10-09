class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.text :description, null: false
      t.boolean :telecommute, null: false
      t.string :industry, null: false
      t.string :size, null: false
      t.integer :year_founded, null: false

      t.timestamps
    end
  end
end
