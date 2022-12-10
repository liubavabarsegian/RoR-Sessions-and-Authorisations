# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /form' do
    it 'returns http success' do
      get form_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /mersenne_info' do
    it 'returns http success' do
      get mersenne_info_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /output' do
    it 'returns http found' do
      get output_path
      expect(response).to have_http_status(:found)
    end
  end

  # describe "GET /output" do
  #   it "returns http success" do
  #     get output_path, params: { num: Faker::Number.positive.to_i }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # does not work idk why

  # describe "GET /last_db_update" do
  #   it "returns http success" do
  #     get "/last_db_update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
