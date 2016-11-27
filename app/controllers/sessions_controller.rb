class SessionsController < ApplicationController
  CALLBACK_URL = "https://techacademy-yumiko55.c9users.io/oauth/callback"
  
  def connect
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL , "response_type" => "token")
  end
  
  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
    
    return redirect_to :root if response.access_token.nil?
    
   
  #インスタidからユーザーを取得、なければnil
user = User.find_by(uid: response.user.id.to_s)

#nilの場合、ユーザーの新規登録
if user.nil?
  user = User.new(name: response.user.username , uid: response.user.id.to_s , access_token: response.access_token)
  
  if !user.save
    flash[:danger] = "新規登録できませんでした"
    redirect_to root_url
    return
  end
end
    session[:user_id] = user.id
    session[:access_token] = response.access_token

    flash[:success] = "認証しました"
    redirect_to root_url
  end
  
  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_path
  end
end
