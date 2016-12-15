class AdminController < ApplicationController
  def index
    messages = Message.all
    @messages_logged = messages.count
    @average_message_length = messages.reduce(0) { |sum, message| sum + message.content.split.count }.to_f / messages.length
  end
end
