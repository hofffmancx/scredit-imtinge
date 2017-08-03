class AddWeightToArticle < ActiveRecord::Migration[5.0]
  def change
     add_column :articles, :weight, :integer, default: 0 # 权重越大，排序靠前
  end
end
