# frozen_string_literal: true

class ApplicationController < ActionController::Base

  include SetCurrentRequestDetails

  around_action :switch_locale

  def switch_locale(&)
    locale = params[:locale] || session[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

end
