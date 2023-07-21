# frozen_string_literal: true
require "rails_helper"

RSpec.describe AdminPolicy do

  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy?, :lock?, :unlock?, :restore? do
    it "grants access if user is sudo" do
      expect(described_class).to permit(create(:user, :sudo), Admin)
    end

    it "denies access if user is not sudo" do
      expect(described_class).not_to permit(create(:user, :confirmed_with_personal_account), Admin)
    end
  end
end
