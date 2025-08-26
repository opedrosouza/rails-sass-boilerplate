# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    if !current_user.admin?
      render status: :forbidden, plain: "You are not authorized to access this page"
    end
  end
end
