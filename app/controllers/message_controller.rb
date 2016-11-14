class MessageController < ApplicationController
  def new
    @message = Message.new
    
    @days_to_election = 720
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to root_path
    else
      @errors = @message.errors.full_messages
      render 'new'
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :email_address, :content)
  end
end
