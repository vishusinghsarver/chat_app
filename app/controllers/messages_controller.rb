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
     
      @messages = Message.all
      
      @message  = current_user.messages.create(content: params[:content],reciver_id:params[:reciver_id])
    
    end
end
