# frozen_string_literal: true
class Admin::AccountsController < Admin::ApplicationController

  before_action :account, only: [:show, :destroy]

  def index
    @pagy, @accounts = pagy(search_for(record: Account, order: "created_at ASC, personal DESC"))
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy
    if @account == current_account
      flash[:error] = t("admin.accounts.cannot_destroy")
    else
      @account.discard
      redirect_to admin_accounts_path, notice: t("admin.accounts.destroyed")
    end
  end

  private

  def account
    @account ||= Account.find(params[:id])
  end

end
