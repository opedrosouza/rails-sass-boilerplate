# frozen_string_literal: true

class ApplicationController < ActionController::Base

  around_action :switch_locale
  before_action :authenticate_user!, unless: :devise_controller?

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &)
  end

end
