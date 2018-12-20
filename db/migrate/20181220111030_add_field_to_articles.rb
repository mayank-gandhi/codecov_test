class AddFieldToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author_id, :integer
    add_index :articles, :author_id
  end
end
