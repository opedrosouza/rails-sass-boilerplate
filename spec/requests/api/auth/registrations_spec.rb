# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Api::Registrations" do
  let!(:oauth_application) { create(:oauth_application) }

  describe "POST /api/v1/users" do
    context "when params is correct" do
      before do
        post api_auth_registrations_path, params: { client_id: oauth_application.uid, user: attributes_for(:user) }
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
        post api_auth_registrations_path, params: { client_id: oauth_application.uid, user: attributes_for(:user, email: nil) }
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
        post api_auth_registrations_path, params: { client_id: "invalid", user: attributes_for(:user) }
      end

      it "returns http unauthorized status" do
        expect(response).to have_http_status(:unauthorized)
      end

      it "returns an error in the body" do
        expect(response.body).to eq({ error: "Invalid client_id" }.to_json)
      end
    end
  end
end
