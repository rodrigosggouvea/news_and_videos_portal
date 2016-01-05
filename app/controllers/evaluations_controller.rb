class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evaluation, only: [:update]

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save if @evaluation.valid?

    redirect_to @evaluation.gradable, notice: t('.success')
  end

  def update
    @evaluation.update(evaluation_params)
    redirect_to @evaluation.gradable, notice: t('.success')
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find params[:id]
  end

  def evaluation_params
    params.require(:evaluation).permit(:gradable_id, :gradable_type, :user_id, :grade)
  end
end
