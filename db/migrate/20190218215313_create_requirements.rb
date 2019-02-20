class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.belongs_to :technology, index: true
      t.belongs_to :listing, index: true

      t.timestamps
    end

    add_index :requirements, [:technology_id, :listing_id], unique: true
  end
end
