class ConversationsController < ApplicationController
  before_action :authorize

  def index
    @users = User.all
    @conversations = Conversation.all
    @conversations.check_empty_messages
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

              