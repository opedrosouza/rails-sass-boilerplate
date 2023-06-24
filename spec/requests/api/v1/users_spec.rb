# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Api::V1::Users" do
  let!(:oauth_application) { create(:oauth_application) }

  describe "POST /api/v1/users" do
    context "when params is correct" do
      before do
        post api_v1_users_path, params: { client_id: oauth_application.uid, user: attributes_for(:user) }
      end

      it "returns http created status" do
        expect(response).to have_http_status(:created)
      end

      it "returns a new user in the body" do
        expect(response.body).to eq(UserSerializer.new(User.last).to_json)
      end
    end

    context "when params is incorrect" do
      before do
        post api_v1_users_path, params: { client_id: oauth_application.uid, user: attributes_for(:user, email: nil) }
      end

      it "returns http unprocessable_entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "returns an error in the body" do
        expect(response.body).to eq({ error: ["Email can't be blank"] }.to_json)
      end
    end

    context "when client_id is incorrect" do
      before do
        post api_v1_users_path, params: { client_id: "invalid", user: attributes_for(:user) }
      end

      it "returns http unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns an error in the body" do
        expect(response.body).to eq({ error: "Invalid client_id" }.to_json)
      end
    end
  end

  describe "GET /api/v1/users/me" do
    let!(:user) { create(:user, :confirmed) }
    let!(:access_token) { create(:access_token, resource_owner_id: user.id, application: oauth_application) }

    context "when user is authenticated" do
      before do
        get me_api_v1_users_path, params: {}, headers: { Authorization: "Bearer #{access_token.token}" }
      end

      it "returns http ok status" do
        expect(response).to have_http_status(:ok)
      end

      it "returns the current user in the body" do
        expect(response.body).to eq(UserSerializer.new(user).to_json)
      end
    end

    context "when user is not authenticated" do
      before do
        get me_api_v1_users_path, params: {}
      end

      it "returns http unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

  end
end
