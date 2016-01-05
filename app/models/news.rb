class News < ActiveRecord::Base
  include Taggable
  include Gradable
  belongs_to :user
  has_many :comments, as: :commentable

  validates :user_id, presence: true
  validates :title_pt, presence: true
  validates :title_es, presence: true
  validates :text_pt, presence: true
  validates :text_es, presence: true

  scoped_search on: [:title_pt, :title_es, :text_es, :text_pt]
  scoped_search in: :tags, on: :name
  scoped_search in: :user, on: [:name, :email]

end
