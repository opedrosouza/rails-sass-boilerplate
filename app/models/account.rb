# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id           :bigint           not null, primary key
#  active       :boolean          default(FALSE), not null
#  discarded_at :datetime
#  personal     :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :bigint           not null
#
# Indexes
#
#  index_accounts_on_discarded_at  (discarded_at)
#  index_accounts_on_owner_id      (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Account < ApplicationRecord

  include PgSearch::Model

  belongs_to :owner, class_name: "User", inverse_of: :owned_accounts
  has_many :account_users, inverse_of: :account, dependent: :destroy
  has_many :users, through: :account_users

  validates :personal, inclusion: { in: [true, false] }
  validates :active, inclusion: { in: [true, false] }

  after_create :set_owner_account_user

  pg_search_scope :search, against: [:id, :owner_id]

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :personal, -> { where(personal: true) }
  scope :professional, -> { where(personal: false) }

  delegate :email, to: :owner

  def active!
    update!(active: true)
  end

  def active?
    active
  end

  private

  # This method is used to set the owner of the account user.
  def set_owner_account_user
    account_users.create(user: owner, account_owner: true, admin: true, member: true, current_role: "admin")
  end

end
