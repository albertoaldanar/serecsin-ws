class Api::V1::UsersController < ApplicationController
  # before_action :require_params

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
    if params[:username] || params[:password]
      @user = User.where(username: params[:username], password: params[:password])

      if @user.count == 0
          render json: { "response": "Invalid credentials"}, status: 422

      else
          render json: { "user": @user, "response": "SUCCESS"}, status: :ok
      end
    else
      render json: {"response": "No credentials given"}, status: :ok
    end
  end

  def edit_user
    user = User.find(params[:id])
    user.update!(require_params)

    render json: { "user_updated": user, "response": "SUCCESS" }
  end

  private
  def require_params
    params.require(:user).permit(:username, :email, :password)
  end
end
