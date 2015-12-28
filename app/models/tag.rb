class Tag < ActiveRecord::Base
  validates :name, presence: true
  validates :locale, presence: true
end
