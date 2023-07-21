# frozen_string_literal: true
class Admin::AccountsController < Admin::ApplicationController

  before_action :account, only: [:show, :destroy]

  def index
    @pagy, @accounts = pagy(search_for(record: Account, order: "created_at ASC, personal DESC"))
  end

  def show; end

  def new
    @account = Account.new
    @account.build_owner
  end

  def edit; end

  def create; end

  def update; end

  def destroy
    if @account == current_account
      flash.now[:error] = t("admin.accounts.cannot_destroy")
      render turbo_stream: turbo_stream.update("flash", partial: "layouts/admin/flash")
    else
      @account.discard
      flash.now[:success] = t("admin.accounts.destroyed")
      render turbo_stream: [
        turbo_stream.update("flash", partial: "layouts/admin/flash"),
        turbo_stream.replace(@account, partial: "admin/accounts/account", locals: { account: @account }),
      ]
    end
  end

  def restore
    @account = Account.discarded.find(params[:id])
    @account.undiscard

    flash.now[:success] = t("admin.accounts.restored")
    render turbo_stream: [
      turbo_stream.update("flash", partial: "layouts/admin/flash"),
      turbo_stream.replace(@account, partial: "admin/accounts/account", locals: { account: @account }),
    ]
  end

  private

  def account
    @account ||= Account.find(params[:id])
  end

  def can_destroy?
    @account != current_account
  end

end
