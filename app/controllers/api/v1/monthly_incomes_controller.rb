class Api::V1::MonthlyIncomesController < Api::V1::BaseController
  before_action :authenticate_user!


  def index
    @monthly_incomes = @current_resource.monthly_incomes
  end

  def create
    @current_resource.build_all_months(@current_resource,params[:value])
    index
  def update
    @current_resource.monthly_incomes.find(params[:id]).update!(value: params[:value])
  end

end
