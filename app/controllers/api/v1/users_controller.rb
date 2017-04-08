class Api::V1::UsersController < Api::V1::BaseController

  before_action :authenticate_user!

  def show
  end

  def update
    @current_resource.update!(user_params)
  end

  private

  def user_params
    params.permit(:full_name, :picture)
  end

end
