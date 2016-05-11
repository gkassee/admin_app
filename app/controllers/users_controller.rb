class UsersController < ApplicationController
  
  def index
    @user = User.all
    @posts = Post.all
    @post = Post.new
  end
  

  def show
  end


  def new
    @user = User.new
  end


  def create
  	@user = User.new(user_params)
    @user.save
    # flash[:notice] 
    redirect_to new_session_path
  end


  def edit
  end

  private


  def user_params
    params.require(:user).permit(:name, :password)
  end


end
