class PostsController < ApplicationController
  def index
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  end

  def update
  	@post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
    redirect_to post_path(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	# @post.user_id = current_user.id
    if @post.save
  		redirect_to root_path
  	else
  		flash[:notice] = "There was a problem creating your post."
  	end
  end


  private

  def post_params
  	params.require(:post).permit(:title, :body, :user_id)
  end

end
