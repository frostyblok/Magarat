# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit]
  def show
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @posts = @user.posts.order(created_at: :desc)
  end

  def update
    current_user.update(user_params)
	  redirect_to current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :website, :bio, :phone, :gender, :email, :avatar)
  end
end
