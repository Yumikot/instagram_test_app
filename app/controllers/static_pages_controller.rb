class StaticPagesController < ApplicationController
  def home
    if logged_in?
      access_token = current_user.access_token      
      if (access_token == nil)
        redirect_to controler: 'session', action: 'connect'
      end
      client = Instagram.client(access_token: access_token)
#      client = Instagram.client(access_token: session[:access_token])
      @medias = client.user_recent_media
    end
  end
end
