class SessionsController < ApplicationController
  skip_before_action :require_user_logged_in

  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:notice] = "success to login"
      redirect_to @user
    else
      flash.now[:alert] = "fail to login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "success to logout"
    redirect_to root_url
  end

  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
