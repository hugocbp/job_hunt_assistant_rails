class CreateRequirements < ActiveRecord::Migration[6.0]
  def change
    create_table :requirements do |t|
      t.references :technology, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
