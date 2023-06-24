# frozen_string_literal: true

class ApplicationController < ActionController::Base

  layout "storefront"
  around_action :switch_locale

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

end
