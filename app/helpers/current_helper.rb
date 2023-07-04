# frozen_string_literal: true
module CurrentHelper

  def current_account
    Current.account
  end

  def current_account_user
    return unless current_account

    @current_account_user ||= current_account.account_users.includes(:user).find_by(user: current_user)
  end

  def current_account_admin?
    !!current_account_user&.admin?
  end

  def other_accounts
    @other_accounts ||= current_user.accounts.order(name: :asc).where.not(id: current_account.id)
  end

end
