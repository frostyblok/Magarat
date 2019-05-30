class PostsController < ApplicationController
	def index; end

	def new; end

	def create
		Post.create(post_params)
		redirect_to root_path
	end

	def show
		@post = Post.find(params[:id])
		@user_post = current_user.posts.find_by!(id: params[:id])
		rescue ActiveRecord::RecordNotFound
	end

	def destroy
		post = current_user.posts.find(params[:id])
		post.destroy

		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:description, :image, :user_id)
	end
end
