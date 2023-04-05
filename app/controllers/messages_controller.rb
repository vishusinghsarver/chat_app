class MessagesController < ApplicationController
  before_action :get_messages, only: %i[ index ]
  skip_before_action :verify_authenticity_token

  def index
  end
  
  def create
      @message  = current_user.messages.create(content: params[:content],receiver_id:params[:format])
      if @message.save
          if params[:action]=="create"
            
            redirect_to "/users/id.#{current_user.messages.last.receiver_id}?",allow_other_host: true
          end
      end
  end

  private
  def get_messages
    receiver=Message.where("user_id=? AND receiver_id=?",params[:format],current_user.id)
      sender=Message.where("user_id=? AND receiver_id=?",current_user.id,params[:format])
      @messages = (receiver + sender).sort
  end
end
