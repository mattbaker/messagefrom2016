class MessageController < ApplicationController
  def new
    @message = Message.new
    
    @days_to_election = 720
  end

  def create
    @message = Message.create(message_params)

    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:subject, :email_address, :content)
  end
end
