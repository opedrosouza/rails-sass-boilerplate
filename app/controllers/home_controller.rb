# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @roles = current_account_user.roles
  end
end
