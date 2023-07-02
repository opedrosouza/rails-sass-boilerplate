# frozen_string_literal: true
# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  role          :integer          default("member"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id  (account_id)
#  index_account_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
require "rails_helper"

RSpec.describe AccountUser do
  describe "validations" do
    it { is_expected.to validate_inclusion_of(:account_owner).in_array([true, false]) }
    it { is_expected.to validate_presence_of(:role) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user).inverse_of(:account_users) }
    it { is_expected.to belong_to(:account).inverse_of(:account_users) }
  end

  describe "enums" do
    it { is_expected.to define_enum_for(:role).with_values(member: 0, admin: 1) }
  end

end
