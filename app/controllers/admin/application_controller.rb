# frozen_string_literal: true
class Admin::ApplicationController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :can_access?
  after_action :verify_authorized

  private

  def can_access?
    authorize :admin
  end

end
