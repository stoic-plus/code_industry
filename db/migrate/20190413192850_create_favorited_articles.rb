class CreateFavoritedArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :favorited_articles do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
    end
  end
end
