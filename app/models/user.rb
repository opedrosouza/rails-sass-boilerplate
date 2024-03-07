# frozen_string_literal: true
# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  accepted_terms         :boolean          default(FALSE), not null
#  accepted_terms_at      :datetime
#  birthdate              :date
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
#  gender                 :string           default("unspecified"), not null
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
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
  has_many :owned_accounts, class_name: "Account", inverse_of: :owner, foreign_key: :owner_id, dependent: :destroy
  has_many :account_users, dependent: :destroy, inverse_of: :user
  has_many :accounts, through: :account_users
  has_many :addresses, as: :addressable, dependent: :destroy

  after_create :create_default_account, if: -> { owned_accounts.empty? }

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
    first_name.present? ? "#{first_name} #{last_name}" : I18n.t("models.user.full_name")
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
    super && !discarded? && owned_accounts.active.any?
  end

  # Create default account for user
  def create_default_account
    owned_accounts.create(personal: true)
  end

end
