class Api::V1::InstallmentsController < Api::V1::BaseController

  before_action :authenticate_user!
  before_action :create_monthly_arrearages_installments, only: [:index]
  before_action :set_installment, only: [:update]

  def index
    params[:page] ||= 1
    @installments = @current_resource.installments.includes(:arrearage).where(year: params[:year], month: params[:month]).page(params[:page])
    load_totalizer

  end

  def update
    @installment.update!(installment_params)
  end

  private

  def installment_params
    params.permit(:pay, :value, :receipt)
  end

  def set_installment
    @installment = @current_resource.installments.find(params[:id])
  end

  def create_monthly_arrearages_installments
    params[:month] ||= (Time.zone.now.month)  -1
    params[:year] ||= Time.zone.now.year
    Installment.create_monthly_arrearages_installments(@current_resource,params[:month], params[:year])

  end

  def filter_params
    params.permit(:paid, :year, :month)
  end

  def load_totalizer
    month_installments = @current_resource.installments.where(year: params[:year], month: params[:month])
    @monthly_incomes = @current_resource.monthly_incomes.find_by(month: params[:month]).value
    @paid_value = month_installments.paid.sum(:value)
    @pending_value = month_installments.pending.sum(:value)
    @total_value = month_installments.sum(:value)
    @total_remaing = @monthly_incomes - @total_value
  end


end
