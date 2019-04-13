class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.string :author
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
    end
  end
end
