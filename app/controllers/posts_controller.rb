class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only:[:edit, :update, :destroy]
	def ensure_correct_user
		@post = Post.find(params[:id])
		if @post.user_id != current_user.id
			redirect_to posts_path
		end
	end

	def index
		@posts = Post.all.order(id: "DESC")
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
		if @post.save
			flash[:notice] = "NEW POST CREATE !"
			redirect_to post_path(@post)
		else
			render("posts/new")
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "UPDATE YOUR POST !"
			redirect_to post_path(@post)
		else
			render("posts/edit")
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	protected
	def post_params
		params.require(:post).permit(:title, :body, :post_image)
	end
end
