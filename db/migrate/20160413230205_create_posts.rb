class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.string :title, null: false
      t.text :body

      t.timestamps null: false
    end
  end
end
