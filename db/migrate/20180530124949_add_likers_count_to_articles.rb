class AddLikersCountToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :likers_count, :integer, :default => 0
  end
end
