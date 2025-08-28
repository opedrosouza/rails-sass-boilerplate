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

  pg_search_scope :search,
                  against: [ :first_name, :last_name, :email ],
                  using: {
                    tsearch: {
                      prefix: true,
                      any_word: true
                    }
                  }

  def full_name
    first_name.present? ? "#{first_name} #{last_name}" : I18n.t("models.user.full_name")
  end

  def admin?
    admin
  end
end
