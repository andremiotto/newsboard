class Review < ApplicationRecord
  belongs_to :asker, class_name: 'User', foreign_key: 'user_id'
  belongs_to :article

  validates :asker, :text, presence: true

end
