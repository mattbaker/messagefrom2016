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
    @messages_authorized = messages.find_all { |message| message.authorized }.count
    @messages_sent = messages.find_all { |message| message.sent }.count

    @distinct_zips = Message.select(:zip).distinct.length
  end

  def send_messages
    unsent_messages = Message.where({sent: false, authorized: true})

    unsent_messages.each do |message|
      UserMailer.send_message_from_2016(message).deliver_later
      message.sent = true;
      message.save
    end

    @messages_sent = unsent_messages.length
  end
end
