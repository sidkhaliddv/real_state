class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.integer :size
      t.integer :price
      t.integer :status
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
