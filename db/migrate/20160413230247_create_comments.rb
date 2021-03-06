class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.text :comment, null: false
      t.string :author, null: false

      t.timestamps null: false
    end
  end
end
