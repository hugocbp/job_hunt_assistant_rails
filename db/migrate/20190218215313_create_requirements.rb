class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.belongs_to :technology, foreign_key: true
      t.belongs_to :listing, foreign_key: true

      t.timestamps
    end

    add_index :requirements, [:technology_id, :listing_id], unique: true
  end
end
