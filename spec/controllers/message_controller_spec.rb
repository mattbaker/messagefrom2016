require 'rails_helper'

describe MessageController do
  let!(:message) { Message.new(content: "bloop", email_address: "me@me.com")}
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

    it "redirects to root if a message is successfully saved" do
      post :create, params: { message: {content: "bleep", email_address: "bloop", subject: "AHHHHHHH"} }
      expect(response).to redirect_to('/')
    end

    it "renders the 'new' partial if a message is not saved" do
      post :create, params: {message: {subject: "",content:"",email_address:""} }
      expect(response).to render_template(:new)
    end

    describe "validations" do

      it "is invalid when not passed the required strong params" do
        post :create, params: {message: {subject: "", email_address: "", content: ""}}
        expect(assigns(:errors)).to_not be_empty
      end

    end
  end








end
