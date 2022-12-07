require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /form" do
    it "returns http success" do
      get "/pages/form"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /result" do
    it "returns http success" do
      get "/pages/result"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /db_to_xml" do
    it "returns http success" do
      get "/pages/db_to_xml"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /last_db_update" do
    it "returns http success" do
      get "/pages/last_db_update"
      expect(response).to have_http_status(:success)
    end
  end

end
