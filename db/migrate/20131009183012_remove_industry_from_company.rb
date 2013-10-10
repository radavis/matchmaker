class RemoveIndustryFromCompany < ActiveRecord::Migration
  def up
    remove_column :companies, :industry
  end
  def down
    add_column :companies, :industry, :string, null: false
  end
end
