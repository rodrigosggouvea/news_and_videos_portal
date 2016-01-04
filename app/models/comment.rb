class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :locale, presence: true
  validates :message, presence: true
end
