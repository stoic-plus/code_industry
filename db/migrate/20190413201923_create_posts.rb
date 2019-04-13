class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :upvotes
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
