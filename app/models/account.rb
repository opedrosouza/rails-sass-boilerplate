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

  after_create :create_account_user_for_owner

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

  def inactive!
    update!(active: false)
  end

  def inactive?
    !active?
  end

  def name
    personal? ? "#{owner.first_name}'s Personal Account" : "#{owner.first_name}'s Professional Account"
  end

  private

  # This method is used to set the owner of the account user.
  def create_account_user_for_owner
    account_users.create!(user: owner, account_owner: true, admin: true)
  end

end
