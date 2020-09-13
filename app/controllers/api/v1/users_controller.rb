class Api::V1::UsersController < ApplicationController
  # before_action :accept_all_params

  def all_users
    @users = User.all
    render json: {"users": @users}
  end

  def create_user
    @user = User.new(require_params)

    if @user.save
      render json: { "user": @user, "response": "SUCCESS"}, status: :ok
    else
      render json: { error: @user.errors, is_success: false}, status: 422
    end
  end

  def login
    @user = User.where(username: params[:username])

    if "nelsemedo" == params[:password]
      render json: { "user": @user, "response": "SUCCESS"}, status: :ok
    else
      render json: { "response": "Invalid credentials"}, status: 422
    end
  end

  private
  def require_params
    params.require(:user).permit(:username, :email, :password)
  end
end
