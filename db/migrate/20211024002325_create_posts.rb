class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer     :user_id
      t.string      :description
      t.string      :image_title
      t.text        :image
      t.timestamps
    end
  end
end
