# frozen_string_literal: true

class App::ApplicationController < ApplicationController
  before_action :authenticate_user!

  def pundit_user
    current_user
  end
end
