class SearchController < ApplicationController
  def index
    if params[:query].start_with?("#")
      query = params[:query].gsub("#", "")
      @posts = Post.joins(:hash_tags).where(hash_tags: {
          name: query
      })
    else
      @posts = Post.where("lower(description) like lower(?)", "%#{params[:query]}%")
    end
  end
end
