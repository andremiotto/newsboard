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

# Provavelmente necessitará de tabela própria Followers
  # acts_as_followable

  # acts_as_follower

  acts_as_liker

  acts_as_mentionable
end
