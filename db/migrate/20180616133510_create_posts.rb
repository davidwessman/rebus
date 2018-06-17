class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.text :answer

      t.index :slug, unique: true

      t.timestamps
    end
  end
end
