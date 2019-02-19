class AddCompanyToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :company, foreign_key: true
  end
end
