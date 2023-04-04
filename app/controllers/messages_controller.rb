class MessagesController < ApplicationController
  before_action :get_messages
  skip_before_action :verify_authenticity_token
  def index
    
  end

  def create
  
    @message = current_user.messages.build(content:params[:content])
    
    if @message.save
      
      redirect_to "/users/#{current_user.id}"
    else
      render '/messages/index'
    end
  end

    private

    def get_messages
      
      @message  = current_user.messages.create(content: params[:content],reciver_id:params[:reciver_id])
      recived=Message.where("user_id=? AND reciver_id=?",params[:format],current_user.id)
      sender=Message.where("user_id=? AND reciver_id=?",current_user.id,params[:format])
      @messages = (recived + sender).sort
      
    end
end
