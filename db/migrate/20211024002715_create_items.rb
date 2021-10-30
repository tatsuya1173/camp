class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer     :post_id
      t.string      :products_name
      t.string      :brand
      t.string      :size
      t.integer     :price
      t.text        :text
      t.text        :item_image

      t.timestamps
    end
  end
end
