class AddStoryCategoryIdToStory < ActiveRecord::Migration[5.0]
  def change
      add_column :stories,:story_category_id,:integer
  end
end
