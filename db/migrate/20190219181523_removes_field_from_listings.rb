class RemovesFieldFromListings < ActiveRecord::Migration[6.0]
  def up
    remove_column :listings, :company
  end

  def down
    remove_column :listings, :company, :string
  end
end
