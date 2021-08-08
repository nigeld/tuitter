require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followers" do
    it "returns http success" do
      get "/users/followers"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /followed" do
    it "returns http success" do
      get "/users/followed"
      expect(response).to have_http_status(:success)
    end
  end

end
