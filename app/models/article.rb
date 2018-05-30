class Article < ApplicationRecord

# OK
  belongs_to :user, class_name: 'User', foreign_key: 'owner_id'
# OK
  has_many :reviews, dependent: :destroy
  # OK
  has_many :askers, through: :reviews

  acts_as_likeable

  # acts_as_mentioner
end
