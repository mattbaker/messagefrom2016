class AdminController < ApplicationController
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == ENV["ADMIN_PASSWORD"]
    end
  end

  def index
    messages = Message.all
    @messages_logged = messages.count
    @average_message_length = messages.reduce(0) { |sum, message| sum + message.content.split.count }.to_f / messages.length
  end
end
