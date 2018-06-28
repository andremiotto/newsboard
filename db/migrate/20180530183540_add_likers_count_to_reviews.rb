class AddLikersCountToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :likers_count, :integer, :default => 0
  end
end
