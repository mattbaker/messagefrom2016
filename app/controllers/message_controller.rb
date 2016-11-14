class MessageController < ApplicationController
  def new
    @message = Message.new
    
    @days_to_election = 720
  end

  def create
    @message = Message.create(params['message'])

    redirect_to :action => new
  end
end
