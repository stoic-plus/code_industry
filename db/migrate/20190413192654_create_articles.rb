class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :source
      t.string :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.text :context
      t.references :topic, foreign_key: true
    end
  end
end
