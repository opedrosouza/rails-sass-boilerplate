# frozen_string_literal: true

class App::HomeController < App::ApplicationController
  def index
    @roles = current_account_user.roles
  end
end
