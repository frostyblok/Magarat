class IndexController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(2)
  end
end
