require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  # describe "POST #send" do
  #   it "sends an email" do
  #     # confirmation = double("something to return")
  #     message_delivery = instance_double(ActionMailer::MessageDelivery)
      
  #     test_message = Fabricate(:message, content: "this is a test")
  #     expect(UserMailer)
  #       .to receive(:send_message_from_2016)
  #       .with(test_message)
  #       .and_return(message_delivery)
  #     allow(message_delivery).to receive(:deliver_later)

  #     post :send_messages
  #   end
  # end

  describe "GET #index" do
    it "returns http 'success' when authorized" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:#{ENV["ADMIN_PASSWORD"]}")

      get :index
      expect(response).to have_http_status(:success)
    end

    it "calculates the average words per minute correctly" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:#{ENV["ADMIN_PASSWORD"]}")
      Fabricate(:message, content: "this is a test")

      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:average_message_length)).to eq 4.0
    end

    it "calculates the average words per minute as 0 when there are no messages" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:#{ENV["ADMIN_PASSWORD"]}")

      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:average_message_length)).to eq 0
    end
    
    it "returns http 'fuck off' when not authorized" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
