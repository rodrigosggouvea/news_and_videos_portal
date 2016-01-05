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

  accepts_nested_attributes_for :comments


end
