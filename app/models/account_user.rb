# frozen_string_literal: true

# == Schema Information
#
# Table name: account_users
#
#  id            :bigint           not null, primary key
#  account_owner :boolean          default(FALSE), not null
#  current_role  :string           default("member"), not null
#  discarded_at  :datetime
#  roles         :jsonb            not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_account_users_on_account_id    (account_id)
#  index_account_users_on_discarded_at  (discarded_at)
#  index_account_users_on_roles         (roles) USING gin
#  index_account_users_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class AccountUser < ApplicationRecord

  ROLES = [:admin, :member].freeze
  include Rolified

  belongs_to :user, inverse_of: :account_users
  belongs_to :account, inverse_of: :account_users

  validates :account_owner, inclusion: { in: [true, false] }
  validates :roles, presence: true

  delegate :email, to: :user

  def owner?
    account_owner
  end

end
