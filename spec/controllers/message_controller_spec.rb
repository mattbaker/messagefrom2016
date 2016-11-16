require 'rails_helper'

describe MessageController do

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

  describe "POST #create" do

    context "when data is valid" do
      it "redirects to root if a message is successfully saved" do
        post :create, params: { message: {content: "bleep", email_address: "bloop", subject: "AHHHHHHH"} }
        expect(response).to redirect_to(root_path)
      end

      it "sets a notice that the message was successfully created" do
        post :create, params: { message: {content: "bleep", email_address: "bloop", subject: "AHHHHHHH"} }
        expect(flash[:notice]).to eq "Message successfully created."
      end

      it "sends an email" do
        confirmation = double("something to return")
        test_message = double("message", save: true)
        expect(Message).to receive(:new).and_return(test_message)
        expect(confirmation).to receive(:deliver_now).and_return(nil)
        expect(UserMailer)
          .to receive(:confirm)
          .with(test_message)
          .and_return(confirmation)
        post :create, params: {message: {content:"some content", email_address: "email@email.email", subject: "some subject"} }
      end

    end

    context "when data is invalid" do
      it "renders the 'new' partial" do
        post :create, params: {message: {subject: "",content:"",email_address:""} }
        expect(response).to render_template(:new)
      end
      it "populates errors" do
        post :create, params: {message: {subject: "", email_address: "", content: ""}}
        expect(assigns(:errors)).to_not be_empty
      end
    end
  end

  describe "GET #confirm" do
    context "with a valid auth token" do
      before :each do
        @test_msg = Message.create!(
          subject: "fake subject",
          email_address: "foo@foo.com",
          content: "this is test content"
        )
      end

      it "finds a message by auth token" do
        get :confirm, params: {token: @test_msg.auth_token}
        expect(assigns(:message)).to eq(@test_msg)
      end

      it "sets authorized to true" do
        get :confirm, params: {token: @test_msg.auth_token}
        expect(assigns(:message).authorized).to be(true)
      end

      it "saves the message after authorization" do
        get :confirm, params: {token: @test_msg.auth_token}
        expect(assigns(:message)).to be_persisted
      end

      it "sets a notice after authorization" do
        get :confirm, params: {token: @test_msg.auth_token}
        expect(flash[:notice]).to eq "Your email #{@test_msg.email_address} has been confirmed."
      end
    end

    context "with an invalid auth token" do
      it "redirects to root" do
        get :confirm, params: {token: "this does not exist"}
        expect(response).to redirect_to(root_path)
      end

      it "sets an error upon invalid authorization" do
        get :confirm, params: {token: "this does not exist"}
        expect(flash[:error]).to eq  "Unable to confirm your email address. Please contact support@#{Rails.application.config.production_host}"
      end
    end
  end

end
