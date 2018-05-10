class Article < ApplicationRecord

  # has_many :reviews
  # has_many :users, through: :reviews

  belongs_to :user, class_name: 'User', foreign_key: 'owner_id'
end
