# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

  def edit
	  current_user
  end

  def update
    current_user.update(user_params)
	  redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :website, :bio, :phone, :gender, :email)
  end
end
