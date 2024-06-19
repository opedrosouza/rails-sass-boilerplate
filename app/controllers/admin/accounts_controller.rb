# frozen_string_literal: true

class Admin::AccountsController < Admin::ApplicationController

  before_action :account, only: [:show]

  def index
    @pagy, @accounts = pagy(search_for(record: Account), items: 20)
  end

  def show; end

  private

  def account
    @account ||= Account.find(params[:id])
  end

end
