class UsersController < ApplicationController
  skip_before_action :require_user_logged_in, only: [:new ,:create]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    all_results = @user.results.order(victory: :desc)
    @results = all_results.where(victory: 1..9).to_a
    @average = @results.length == 0 ? @results.length : (@results.length.to_f / all_results.length) * 100
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:alert] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :email, :password, :password_confirmation)
  end
end
