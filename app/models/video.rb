class Video < ActiveRecord::Base
  include Taggable
  include Gradable
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :link, presence: true
end
