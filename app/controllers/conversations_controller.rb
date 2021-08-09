class ConversationsController < ApplicationController
  before_action :authorize

  def index
    #@users = User.where.not(id: current_user.id)
    @users = User.all
    @conversations = Conversation.all
    #@conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
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

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end
end

