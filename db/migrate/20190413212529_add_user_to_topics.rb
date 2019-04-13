class AddUserToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :moderator_id, :integer, index: true
    add_foreign_key :topics, :users, column: :moderator_id
  end
end
