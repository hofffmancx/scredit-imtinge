class AddNameToArticleCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :article_categories,:name,:string
  end
end
