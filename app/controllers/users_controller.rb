class UsersController < ApplicationController
  def edit; end
  def update
    if current_user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
