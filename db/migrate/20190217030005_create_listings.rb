class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :company
      t.text :description
      t.text :technologies
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
