require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #index" do
    it "returns http 'success' when authorized" do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("admin:#{ENV["ADMIN_PASSWORD"]}")

      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "returns http 'fuck off' when not authorized" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end

end
