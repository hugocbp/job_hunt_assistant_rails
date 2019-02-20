class AddFieldsToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :scraped_glassdoor_rate, :decimal
    add_column :companies, :user_glassdoor_rate, :decimal
    add_column :companies, :last_scraped, :datetime
  end
end
