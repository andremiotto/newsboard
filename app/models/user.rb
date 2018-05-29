class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true

# OK
  has_many :articles, foreign_key: 'owner_id'
  has_many :reviews
  # has_many :articles, through: :reviews
end
