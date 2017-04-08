class Api::V1::ArrearagesController < Api::V1::BaseController

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_arrearage
    @current_resource.find(params[:id])
  end

  def arrearage_params
    params.permit(:receiver_id)
  end

end
