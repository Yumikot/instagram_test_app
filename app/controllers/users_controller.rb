class UsersController < ApplicationController
  def show 
   @user = User.find(params[:id])
   client = Instagram.client(access_token: "1437067778.76764d5.7181aed7ea1c41e68e1fc3077b939684")
   @medias = client.user_recent_media
  end
  
  def new
    @user = User.new
  end
    def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
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
