# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
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
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_confirmation_token    (confirmation_token) UNIQUE
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#  index_admins_on_unlock_token          (unlock_token) UNIQUE
#
class Admin < ApplicationRecord

  include PgSearch::Model

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_one_attached :avatar

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
    first_name.present? ? "#{first_name} #{last_name}" : I18n.t("models.admin.full_name")
  end

end
