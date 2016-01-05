module Gradable
  extend ActiveSupport::Concern

  included do
    has_many :evaluations, as: :gradable
  end

  def general_evaluation
    grades = evaluations.pluck(:grade)
    return nil unless grades.any?
    (grades.sum / grades.length).round(2)
  end

  def user_evaluation(given_user)
    evaluations.find_or_initialize_by(user: given_user)
  end

end
