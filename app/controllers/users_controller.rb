class UsersController < ApplicationController

  def show 
    client = Instagram.client(access_token: session[:access_token])
    @medias = client.user_recent_media
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @current_user = @user
      session[:user_id] = @user.id
      redirect_to controller: 'session', action: 'connect'
# =>  redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
