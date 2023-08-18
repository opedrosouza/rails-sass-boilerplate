# frozen_string_literal: true

class Admin::ApplicationController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_admin!
  after_action :verify_authorized

  layout "admin"

  private

  def authorize_admin!
    authorize :admin, "#{action_name}?"
  end

end
