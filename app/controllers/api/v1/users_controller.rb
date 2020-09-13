class Api::V1::UsersController < ApplicationController
  before_action :accept_all_params

  def all_users
    @users = User.all
    render json: {"users": @users}
  end

  def create_user
    @user = User.create!(accept_all_params)
    render json: {
      "user": @user
    }
  end

  private
  def accept_all_params
    params.permit!
  end
end
