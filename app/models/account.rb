# frozen_string_literal: true

class Account < ApplicationRecord
  include PgSearch::Model

  belongs_to :owner, class_name: "User", inverse_of: :owned_accounts
  has_many :account_users, inverse_of: :account, dependent: :destroy
  has_many :users, through: :account_users
  has_many :subscriptions, dependent: :destroy

  validates :personal, inclusion: { in: [ true, false ] }
  validates :active, inclusion: { in: [ true, false ] }

  after_create :create_account_user_for_owner

  pg_search_scope :search,
        against: [ :id, :owner_id ],
        associated_against: {
          owner: [ :first_name, :last_name, :email ]
        },
        using: {
          tsearch: {
            prefix: true,
            any_word: true
          }
        }

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
