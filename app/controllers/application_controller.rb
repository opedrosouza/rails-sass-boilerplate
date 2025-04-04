# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  include Currentable
  include Searchable

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  around_action :switch_locale

  before_action :authenticate_user!

  def pundit_user
    current_user
  end

  def switch_locale(&)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  private

  def user_not_authorized
    flash[:error] = t("pundit.not_authorized")
    path_to_redirect = current_user.present? ? authenticated_root_path : root_path
    redirect_back(fallback_location: path_to_redirect)
  end
end
