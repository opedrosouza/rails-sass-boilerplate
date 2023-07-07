# frozen_string_literal: true
class Admin::UsersController < Admin::ApplicationController

  def index
    @pagy, @users = pagy(search_for(User))
  end

end
