class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end


  def create
    @user = User.find_by_name(params[:name])
    @webmaster = Webmaster.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, :notice => "Welcome back, #{@user.name}"
    elsif @webmaster && @webmaster.authenticate(params[:password])
      session[:webmaster_id] = @webmaster.id
      redirect_to root_path, :notice => "Welcome back, #{@webmaster.name}"
    else
      flash[:alert] = "Invalid username or password"
      render "new"
    end
  end

  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy
  #   redirect_to root_path
  # end
  def delete

  end

end
