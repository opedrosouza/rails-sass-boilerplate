# frozen_string_literal: true

class AccountUser < ApplicationRecord
  ROLES = [ :admin, :member ].freeze
  include Rolified

  belongs_to :user, inverse_of: :account_users
  belongs_to :account, inverse_of: :account_users

  validates :account_owner, inclusion: { in: [ true, false ] }
  validates :roles, presence: true

  delegate :email, to: :user

  def owner?
    account_owner
  end
end
