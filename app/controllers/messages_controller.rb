class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end
  def create
    @group = Group.find(params[:group_id])
    Messages.create(messages_params)
  end
  private
  def message_params
    params.require(:message).permit(:text)
  end
end
