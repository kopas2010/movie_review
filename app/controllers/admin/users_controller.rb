class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to admin_user_path(@user)
  end

  def cancel
    @user = User.find(params[:id])
    @user.update(is_deleted: false)
    flash[:notice] = "退会取り消し処理を実行いたしました"
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
