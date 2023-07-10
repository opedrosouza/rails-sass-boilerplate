# frozen_string_literal: true

# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  discarded_at  :datetime
#  role          :integer          default("member"), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id    (account_id)
#  index_account_users_on_discarded_at  (discarded_at)
#  index_account_users_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class AccountUser < ApplicationRecord

  belongs_to :user, inverse_of: :account_users
  belongs_to :account, inverse_of: :account_users

  enum role: { member: 0, admin: 1 }, _default: :member

  validates :account_owner, inclusion: { in: [true, false] }
  validates :role, presence: true

end
