class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.integer :cod_eligible
      t.integer :in_stock
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
