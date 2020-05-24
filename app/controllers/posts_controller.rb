class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to post_path(@post)
	end

	protected
	def post_params
		params.require(:post).permit(:title, :body, :post_image)
	end
end
