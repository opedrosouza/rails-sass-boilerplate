require 'rails_helper'

RSpec.describe "PagesController", type: :request do
  describe "GET /" do
    before do
      get root_path
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "renders the home template" do
      expect(response).to render_template(:home)
    end

    it "includes the correct content in the response body" do
      expect(response.body).to include("Rails SaaS Boilerplate")
    end
  end
end
