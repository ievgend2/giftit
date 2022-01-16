class MessagesController < ApplicationController
  before_action :find_conversation

  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def destroy
    @message = Message.find(params[:message_id])
    @message.destroy
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end

    def find_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
end
