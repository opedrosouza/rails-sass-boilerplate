# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Admin::UsersController" do
  describe "GET /admin/users" do
    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        get admin_users_path
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "display the page title" do
        expect(response.body).to include("All Users")
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        get admin_users_path
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        get admin_users_path
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "GET /admin/users/:id" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        get admin_user_path(user)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "display the page title" do
        expect(response.body).to include(user.email)
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        get admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        get admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "GET /admin/users/:id/edit" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        get edit_admin_user_path(user)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "display the page title" do
        expect(response.body).to include(user.full_name_or_email)
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        get edit_admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        get edit_admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "PATCH /admin/users/:id" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
      end

      context "with valid params" do
        let(:valid_params) do
          {
            user: {
              email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
            },
          }
        end

        before do
          patch admin_user_path(user), params: valid_params
        end

        it "redirects to the admin user page" do
          expect(response).to redirect_to(admin_user_path(user))
        end

        it "displays a flash message" do
          expect(flash[:notice]).to eq("User was successfully updated.")
        end
      end

      context "with invalid params" do
        let(:invalid_params) do
          {
            user: {
              email: "jose",
              first_name: nil,
              last_name: nil,
            },
          }
        end

        before do
          patch admin_user_path(user), params: invalid_params
        end

        it "returns http unprocessable_entity" do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it "display the page title" do
          expect(response.body).to include(user.full_name_or_email)
        end
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        patch admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        patch admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "DELETE /admin/users/:id" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        delete admin_user_path(user)
      end

      it "redirects to the admin users page" do
        expect(response).to redirect_to(admin_users_path)
      end

      it "displays a flash message" do
        expect(flash[:notice]).to eq("User was successfully destroyed.")
      end

      it "user is discarded" do
        expect(user.reload).to be_discarded
      end

      it "user is not destroyed" do
        expect(User.unscoped).to exist(user.id)
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        delete admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        delete admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "PATCH /admin/users/:id/lock" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed, :sudo)
        patch lock_admin_user_path(user)
      end

      it "redirects to the admin user page" do
        expect(response).to redirect_to(admin_user_path(user))
      end

      it "displays a flash message" do
        expect(flash[:notice]).to eq("User was successfully locked.")
      end

      it "user is locked" do
        expect(user.reload).to be_access_locked
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        patch lock_admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        patch lock_admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end

  describe "PATCH /admin/users/:id/unlock" do
    let(:user) { create(:user, :confirmed_with_personal_account) }

    context "when a sudo user is authenticated" do
      before do
        user.lock_access!
        sign_in create(:user, :confirmed, :sudo)
        patch unlock_admin_user_path(user)
      end

      it "redirects to the admin user page" do
        expect(response).to redirect_to(admin_user_path(user))
      end

      it "displays a flash message" do
        expect(flash[:notice]).to eq("User was successfully unlocked.")
      end

      it "user is unlocked" do
        expect(user.reload).not_to be_access_locked
      end
    end

    context "when a non-sudo user is authenticated" do
      before do
        sign_in create(:user, :confirmed_with_personal_account)
        patch unlock_admin_user_path(user)
      end

      it "redirects to root_path" do
        expect(response).to redirect_to(root_path)
      end

      it "displays a flash message" do
        expect(flash[:error]).to eq(I18n.t("pundit.not_authorized"))
      end
    end

    context "when a user is not authenticated" do
      before do
        patch unlock_admin_user_path(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_user_session_path)
      end

      it "displays a flash message" do
        expect(flash[:alert]).to eq(I18n.t("devise.failure.unauthenticated"))
      end
    end
  end
end
