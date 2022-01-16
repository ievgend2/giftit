class ConversationsController < ApplicationController
  before_action :authorize

  def index
    @users = User.all
    Conversation.all.check_empty_messages
    @conversations = []
    Conversation.all.each do |conv|
      if conv.sender_id == current_user.id || conv.recipient_id == current_user.id
                @conversations.push(conv)
        end
    end
  end

  def create
    #uses between scope from model
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
    @conversation.destroy
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end
