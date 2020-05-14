class UsersController < ApplicationController
  #ログインしないと………
  before_action :require_user_logged_in, only: [:show]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @artworks = @user.artworks.order(id: :desc).page(params[:page])
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
     #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました'
        redirect_to @user
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end 
    end
  end

  def destroy
    @user = User.find(params[:id])
     #編集しようとしてるユーザーがログインユーザーとイコールかをチェック
    if current_user == @user
      if @user.destroy
        flash[:success] = 'ユーザー情報を編集しました'
        redirect_to root_url
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        redirect_back(fallback_location: root_path)
      end 
    end
   end

  def likes
    @user = User.find(params[:id])
    @artworks = @user.fav_posts.page (params[:page])
  end

  private

  def set_artwork
  end
  
  
  def user_params
    params.require(:user).permit(:name, :email, :profile, :password, :password_confirmation)
  end
  
end

