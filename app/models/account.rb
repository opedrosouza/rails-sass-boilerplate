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

  belongs_to :owner, class_name: "User", inverse_of: :owned_account
  # This relationship allows us to add more users to the account.
  has_many :account_users, inverse_of: :account, dependent: :destroy
  has_many :users, through: :account_users

  validates :personal, inclusion: { in: [true, false] }
  validates :active, inclusion: { in: [true, false] }

  accepts_nested_attributes_for :owner, allow_destroy: true

  after_create :set_owner_account_user

  pg_search_scope :search, against: [:id, :owner_id]

  delegate :email, to: :owner

  def active!
    update!(active: true)
  end

  def active?
    active
  end

  # TODO: MAKE IT WORK WHEN NEEDED
  # def switch_owner(new_owner, destroy_current_owner = false)
  #   raise ActiveRecord::RecordInvalid unless new_owner.is_a?(User)

  #   current_owner_account = owner.account_users.where(account: self).first

  #   ActiveRecord::Base.transaction do
  #     if destroy_current_owner
  #       owner.discard!
  #       current_owner_account.update!(account_owner: false, role: :user, discarded_at: nil)
  #     else
  #       current_owner_account.update!(account_owner: false, role: :user)
  #     end

  #     new_owner.account_users.create!(account_owner: true, role: :admin, account: self)
  #     new_owner.update(owned_account: self)
  #     self.owner = new_owner
  #     self.save
  #   end
  # end

  private

  # This method is used to set the owner of the account user.
  def set_owner_account_user
    account_users.create(user: owner, account_owner: true, role: :admin)
  end

end
