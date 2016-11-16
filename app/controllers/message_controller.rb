class MessageController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.save
      UserMailer.confirm(@message).deliver_later
      flash[:notice] = "Message successfully created."
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
      flash[:notice] = "Your email #{@message.email_address} has been confirmed."
      redirect_to root_path
    else
      flash[:error] = "Unable to confirm your email address. Please contact support@#{Rails.application.config.production_host}"
      logger.error("Bad authorization token received: #{params[:token]}")
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:email_address, :content)
  end
end
