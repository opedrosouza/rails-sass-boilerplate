# frozen_string_literal: true
module SetCurrentRequestDetails

  extend ActiveSupport::Concern

  included do |base|
    if base < ActionController::Base
      before_action :set_request_details
    end
  end

  def set_request_details
    Current.request_id = request.uuid
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
    Current.user       = current_user
    Current.account    ||= account_from_session || fallback_account
  end

  def account_from_session
    return unless user_signed_in? && (account_id = session[:account_id])

    current_user.accounts.includes(:users).find_by(id: account_id)
  end

  def fallback_account
    return unless user_signed_in?

    current_user.accounts.includes(:users).first
  end

end
