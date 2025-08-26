# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminPolicy do
  permissions :index?, :show?, :create?, :new?, :update?, :edit?, :destroy? do
    it "grants access if user is admin" do
      expect(described_class).to permit(create(:user, :admin))
    end

    it "denies access if user is not admin" do
      expect(described_class).not_to permit(create(:user))
    end
  end
end
