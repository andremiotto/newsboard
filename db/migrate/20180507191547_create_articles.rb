class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :url
      t.text :comment
      t.integer :owner_id

      t.timestamps
    end
  end
end
