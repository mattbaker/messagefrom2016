require 'rails_helper'

describe MessageController do
  let!(:message) { Message.create!(content: "bloop", email_address: "me@me.com")}
  let!(:unsaved_message) {Message.new}
  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns an empty Message object as @message" do
      get :new
      expect(assigns(:message)).to be_an_instance_of (Message)
    end

  end






end
