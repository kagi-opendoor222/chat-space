class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  def index
    set_messages
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)

    if @message.save
      respond_to do |format|
        format.html{redirect_to action: :index}
        format.json
      end
    else
      respond_to do |format|
        set_messages
        format.html{
          redirect_to action: :index
          flash.now[:alert] = "メッセージを入力してください"
          render :index
        }
        format.json{
          render json: { alert: "メッセージを入力してください" }
        }
      end
    end

  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end
  def set_messages
    @messages = @group.messages.includes(:user)
  end
  def message_params
    params.require(:message).permit(:text, :image).merge({user_id: current_user.id, group_id: @group.id})
  end
end
