class IncomesController < ApplicationController
  def create
    IncomeCreator.new(create_params).create_income

    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def create_params
    params.require(:income).permit(:description, :value, :due_at, :received_at)
  end
end
