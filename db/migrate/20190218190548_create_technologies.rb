class CreateTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :technologies do |t|
      t.string :name, unique: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end

    add_index :technologies, :name, unique: true
  end
end
