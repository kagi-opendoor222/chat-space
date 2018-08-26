class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    @messages = @group.messages.includes(:user)
    @message = Message.new
  end
  def create
    @message = Message.new(message_params.merge({user_id: current_user.id, group_id: @group.id}))
    if @message.save
      redirect_to action: :index
    else
      @messages = @group.messages.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end

  end
  private
  def set_group
    @group = Group.find(params[:group_id])
  end
  def message_params
    params.require(:message).permit(:text, :image)
  end
end
