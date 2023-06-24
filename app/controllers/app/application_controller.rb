# frozen_string_literal: true

class App::ApplicationController < ApplicationController

  layout "app"
  before_action :authenticate_user!, unless: :devise_controller?

end
