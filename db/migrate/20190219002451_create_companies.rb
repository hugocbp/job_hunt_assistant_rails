class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, unique: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :companies, :name, unique: true
  end
end
