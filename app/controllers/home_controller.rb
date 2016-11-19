class HomeController < ApplicationController
 def index

    client = Instagram.client(access_token: "1437067778.76764d5.7181aed7ea1c41e68e1fc3077b939684")
    @medias = client.user_recent_media
  end
end  



