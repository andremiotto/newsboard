class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :url
      t.string :comment

      t.timestamps
    end
  end
end
