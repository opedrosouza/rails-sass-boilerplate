# frozen_string_literal: true
class Admin::AccountsController < Admin::ApplicationController

  def index
    @pagy, @accounts = pagy(search_for(record: Account, order: "created_at ASC"))
  end

  def show; end

end
