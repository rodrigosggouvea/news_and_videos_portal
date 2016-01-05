class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :news
  has_many :videos
  has_many :comments
  has_many :evaluations
  has_many :friendships
  has_many :targeted_friendships, class_name: 'Friendship', foreign_key: :target_id

  scoped_search on: [:name, :email]

  def is_friends_with?(user)
    friendships.where(target: user).any? || targeted_friendships.where(user: user).any?
  end
end
