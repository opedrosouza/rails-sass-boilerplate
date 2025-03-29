# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!

  layout "admin"

  def pundit_user
    current_admin
  end
end
