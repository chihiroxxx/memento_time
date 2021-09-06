module Api
  module V1
class UsersController < ApplicationController
  skip_before_action :check_is_signed_in
  def new
  end

  def create
    user = User.new(user_params)
    user.valid?
    if user.save
      session[:user_id] = user.id
      render json:{message: "create!!!"}, status: 200
    else
      render status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
end
end
