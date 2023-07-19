# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  discarded_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  sudo                   :boolean          default(FALSE), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_discarded_at          (discarded_at)
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord

  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_one_attached :avatar
  has_many :access_tokens,
           class_name: "Doorkeeper::AccessToken",
           foreign_key: :resource_owner_id,
           dependent: :destroy, inverse_of: :resource_owner
  # It can be changed to a has_many association depending on the type of relationship you want to establish.
  has_one :owned_account, class_name: "Account", inverse_of: :owner, foreign_key: :owner_id, dependent: :destroy
  # This relationship is used to get the accounts that the user is a member of.
  has_many :account_users, dependent: :destroy, inverse_of: :user
  has_many :accounts, through: :account_users

  validates :sudo, inclusion: { in: [true, false] }

  before_validation :set_sudo, on: :create, if: -> { sudo.nil? }
  after_create :create_default_account

  pg_search_scope :search,
                  against: [:first_name, :last_name, :email],
                  using: {
                    tsearch: {
                      prefix: true,
                      any_word: true,
                    },
                  }

  # Returns the user's full name or "Sem nome" if the user has no name.
  #
  # @return [String]
  def full_name
    first_name.present? ? "#{first_name} #{last_name}" : "Sem nome"
  end

  def full_name_or_email
    full_name.presence || email
  end

  # Used to authenticate the user through the API.
  def self.authenticate!(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) && user&.active_for_authentication? ? user : nil
  end

  def active_for_authentication?
    return true if sudo?

    super && !discarded? && owned_account.active?
  end

  # Create default account for user
  def create_default_account
    owned_account || create_owned_account(personal: true)
  end

  def sudo?
    sudo
  end

  private

  def set_sudo
    self.sudo = false
  end

end
