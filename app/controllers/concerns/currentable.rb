# frozen_string_literal: true
module Currentable

  extend ActiveSupport::Concern

  included do |base|
    if base < ActionController::Base
      before_action :set_request_details
    end

    helper_method :current_account, :current_account_user, :other_accounts, :account_owner?
  end

  def current_account
    @current_account ||= Current.account
  end

  def current_account_user
    return unless current_account

    @current_account_user ||= current_account.account_users.includes(:user).find_by(user: current_user)
  end

  def other_accounts
    @other_accounts ||= current_user.accounts.order(name: :asc).where.not(id: current_account.id)
  end

  def account_owner?
    @account_owner ||= current_account_user&.owner?
  end

  private

  def set_request_details
    Current.request_id = request.uuid
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
    Current.user       ||= current_user
    Current.account    ||= account_from_session || account_from_cookies || fallback_account
  end

  def account_from_session
    return unless user_signed_in? && (account_id = session[:account_id])

    current_user.accounts.includes(:users).find_by(id: account_id)
  end

  def account_from_cookies
    return unless user_signed_in? && (account_id = cookies.signed[:account_id])

    current_user.accounts.includes(:users).find_by(id: account_id)
  end

  def fallback_account
    return unless user_signed_in?

    current_user.owned_accounts.includes(:users).first
  end

end
