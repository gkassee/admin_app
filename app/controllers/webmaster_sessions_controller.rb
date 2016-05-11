class WebmasterSessionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
  end


  def create
    webmaster = Webmaster.find_by_name(params[:name])
    if webmaster && webmaster.authenticate(params[:password])
      webmaster_sessions[:webmaster_id] = webmaster.id
      redirect_to root_path, :notice => "Welcome back, #{webmaster.name}"
    else
      flash[:alert] = "Invalid username or password"
      render "new"
  end
  

  def delete
  end
end
