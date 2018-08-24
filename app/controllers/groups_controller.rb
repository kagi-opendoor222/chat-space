class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << User.where(id: params[:group][:user_ids])
      redirect_to root_path, notice: "グループを作成しました。"
    else
      render :new
    end
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      @group.users = User.where(id: params[:user_ids])
      redirect_to group_messages_path(@group), notice: "グループ情報を更新しました。"
    else
      render :edit
    end
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end
end
