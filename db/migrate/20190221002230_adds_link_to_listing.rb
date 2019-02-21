class AddsLinkToListing < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :url, :string
  end
end
