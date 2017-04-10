class Api::V1::ReceiversController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_receiver, only: [:show,:update,:destroy]

  def index
    params[:page] ||= 0
    @receivers = @current_resource.receivers.page(params[:page])
  end

  def show
  end

  def create
    @receiver = @current_resource.receivers.create!(receiver_params)
  end

  def update
    @receiver.update!(receiver_params)
  end

  def destroy
    @receiver.destroy!
  end

  private

  def set_receiver
    @receiver = @current_resource.receivers.find(params[:id])
  end

  def receiver_params
    params.permit(:category,:name,:document,:bank_code,:agency, :agency_dv, :account, :account_dv)
  end
end

