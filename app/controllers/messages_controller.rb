class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end
  def create
    @group = Group.find(params[:group_id])
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
  def message_params
    params.require(:message).permit(:text, :image)
  end
end
