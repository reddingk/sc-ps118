class UsersController < ApplicationController
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to PS118 [" + @user.username + "]"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def settings
    
  end  
  
  def edit
    @user = User.find(params[:userid])
    #@user = User.find(params[:id])
  end
  
  def update
    #@user = User.find(params[:userid])
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to :root
    elsif @user.update_attribute(:personal_page ,user_params_personal["personal_page"] )
      flash[:success] = "Gerald updated"
      redirect_to :root
    else
      render 'settings'
    end
  end
  
  def updatehome
    @user = User.find(params[:userid])
    
    if @user.personal_page == nil
      @widgets = ["None", "None", "None", "None"]
    else
      @widgets = @user.personal_page.split(",")
    end
   
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/users'
  end
  
  private

    def user_params
      params.require(:user).permit(:username, :password,:password_confirmation, :email, :firstname, :lastname, :admin, :personal_page)
    end
    
    def user_params_personal
      params.require(:user).permit(:personal_page)
    end
  
end
