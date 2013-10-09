class AddIndustryIdToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :industry_id, :integer, null: false
  end

  def down
    remove_column :companies, :industry_id
  end
end
