class CreateCartLineItems < ActiveRecord::Migration
  def change
    create_table :cart_line_items do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
