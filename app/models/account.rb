# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  active     :boolean          default(FALSE), not null
#  personal   :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_accounts_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Account < ApplicationRecord

  belongs_to :owner, class_name: "User", inverse_of: :owned_account
  # This relationship allows us to add more users to the account.
  has_many :account_users, inverse_of: :account, dependent: :destroy
  has_many :users, through: :account_users

  validates :personal, inclusion: { in: [true, false] }
  validates :active, inclusion: { in: [true, false] }

  after_create :set_owner_account_user

  def active!
    update!(active: true)
  end

  def active?
    active
  end

  private

  # This method is used to set the owner of the account user.
  def set_owner_account_user
    account_users.create(user: owner, account_owner: true, role: :admin)
  end

end
