# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include Pundit::Authorization
  include Pagy::Backend
  include SetCurrentRequestDetails
  include CurrentHelper
  include Searchable

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  around_action :switch_locale

  def switch_locale(&)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

  private

  def user_not_authorized
    flash[:error] = t("pundit.not_authorized")
    redirect_back(fallback_location: root_path)
  end

end
