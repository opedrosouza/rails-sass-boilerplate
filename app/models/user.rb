# frozen_string_literal: true

class User < ApplicationRecord
  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_one_attached :avatar
  has_many :owned_accounts, class_name: "Account", inverse_of: :owner, foreign_key: :owner_id, dependent: :destroy
  has_many :account_users, dependent: :destroy, inverse_of: :user
  has_many :accounts, through: :account_users
  has_many :addresses, as: :addressable, dependent: :destroy

  after_create :create_default_account, if: -> { owned_accounts.empty? }

  pg_search_scope :search,
                  against: [ :first_name, :last_name, :email ],
                  using: {
                    tsearch: {
                      prefix: true,
                      any_word: true
                    }
                  }

  # Returns the user's full name or "Sem nome" if the user has no name.
  #
  # @return [String]
  def full_name
    first_name.present? ? "#{first_name} #{last_name}" : I18n.t("models.user.full_name")
  end

  def full_name_or_email
    full_name.presence || email
  end

  # Create default account for user
  def create_default_account
    owned_accounts.create(personal: true)
  end

  def admin?
    admin
  end
end
