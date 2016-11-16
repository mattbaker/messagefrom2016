class MessageController < ApplicationController
  def new
    @message = Message.new

    @days_to_election = (Date.new(2018,11,6) - Date.today).to_i
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      UserMailer.confirm(@message).deliver_now
      redirect_to root_path
    else
      @errors = @message.errors.full_messages
      render 'new'
    end
  end


  def confirm
    @message = Message.find_by(auth_token: params[:token])
    if @message
      @message.authorized = true
      @message.save
    else
      logger.error("Bad authorization token received: #{params[:token]}")
      redirect_to "/"
    end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :email_address, :content, :zip)
  end
end
