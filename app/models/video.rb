class Video < ActiveRecord::Base
  include Taggable
  include Gradable
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :link, presence: true

  scoped_search on: [:title_pt, :title_es]
  scoped_search in: :tags, on: :name
  scoped_search in: :user, on: [:name, :email]
end
