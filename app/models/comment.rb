class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :locale, presence: true
  validates :message, presence: true

  scope :moderated,   -> { where(moderated: true) }
  scope :unmoderated, -> { where(moderated: false) }
  scope :of_locale, ->(locale) { where(locale: locale) }
end
