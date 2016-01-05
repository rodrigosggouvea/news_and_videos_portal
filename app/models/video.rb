class Video < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  # has_many :taggings, as: :taggable
  # has_many :tags, through: :taggings

  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :link, presence: true
end
