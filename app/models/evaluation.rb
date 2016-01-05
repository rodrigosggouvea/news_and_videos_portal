class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :gradable, polymorphic: true

  validates :grade, presence: true
end
