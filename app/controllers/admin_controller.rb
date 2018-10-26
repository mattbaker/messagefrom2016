class AdminController < ApplicationController
  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == ENV["ADMIN_PASSWORD"]
    end
  end

  def index
    messages = Message.all

    total_words = messages.reduce(0) { |sum, message| sum + message.content.split.count }.to_f
    if messages.length > 0
      @average_message_length = total_words / messages.length
    else
      @average_message_length = 0
    end

    @messages_logged = messages.count

    @distinct_zips = Message.select(:zip).distinct.length
  end
end
