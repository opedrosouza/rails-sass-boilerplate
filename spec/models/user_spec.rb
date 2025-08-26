# frozen_string_literal: true

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
  end
end
