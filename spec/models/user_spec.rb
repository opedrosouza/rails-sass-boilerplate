# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  accepted_terms         :boolean          default(FALSE), not null
#  accepted_terms_at      :datetime
#  birthdate              :date
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  gender                 :string           default("unspecified"), not null
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_discarded_at          (discarded_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
require "rails_helper"

RSpec.describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { is_expected.to have_many(:owned_accounts).class_name("Account") }
    it { is_expected.to have_many(:accounts).through(:account_users) }
    it { is_expected.to have_many(:account_users) }
    it { is_expected.to have_many(:addresses) }
  end

  describe "scopes" do
    describe "discarded" do
      it "returns only discarded users" do
        create(:user)
        create(:user, :discarded)
        expect(described_class.discarded.count).to eq(1)
      end
    end

    describe "kept" do
      it "returns only kept users" do
        create(:user)
        create(:user, :discarded)
        expect(described_class.kept.count).to eq(1)
      end
    end
  end

  describe "callbacks" do
    describe "after_create" do
      it "creates owned account" do
        user = build(:user)
        expect { user.save }.to change(Account, :count).by(1)
      end
    end
  end

  describe "methods" do
    describe "#full_name" do
      it "returns full name" do
        user = create(:user, first_name: "John", last_name: "Doe")
        expect(user.full_name).to eq("John Doe")
      end

      it "returns full name without first name" do
        user = create(:user, first_name: nil, last_name: "Doe")
        expect(user.full_name).to eq(I18n.t("models.user.full_name"))
      end
    end

    describe ".authenticate!" do
      context "when user and account is confirmed" do
        let!(:user) { create(:user, :confirmed, password: "password") }

        before do
          user.owned_accounts.last.active!
        end

        it "returns user" do
          expect(described_class.authenticate!(user.email, "password")).to eq(user)
        end

        it "returns nil" do
          expect(described_class.authenticate!("email", "password")).to be_nil
        end
      end

      context "when user is not confirmed" do
        let!(:user) { create(:user, password: "password") }

        it "returns nil" do
          expect(described_class.authenticate!(user.email, "password")).to be_nil
        end
      end

      context "when user is locked" do
        let!(:user) { create(:user, :confirmed, password: "password") }

        before do
          user.lock_access!
        end

        it "returns nil" do
          expect(described_class.authenticate!(user.email, "password")).to be_nil
        end
      end

      context "when account is not active" do
        let!(:user) { create(:user, :confirmed, password: "password") }

        it "returns nil" do
          expect(described_class.authenticate!(user.email, "password")).to be_nil
        end
      end
    end
  end
end
