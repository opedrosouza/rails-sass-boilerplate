# frozen_string_literal: true
class Admin::UsersController < Admin::ApplicationController

  before_action :user, only: %i[show edit update destroy]

  def index
    @pagy, @users = pagy(search_for(record: User, order: "sudo DESC, created_at ASC"))
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    if User.invite!(user_params)
      redirect_to admin_user_path(@user), notice: t("admin.users.created")
    else
      flash.now[:alert] = t("admin.users.not_created")
      render :new
    end
  end

  def update
    if user.update(user_params)
      redirect_to admin_user_path(user), notice: t("admin.users.updated")
    else
      render :edit
    end
  end

  def destroy
    user.discard
    redirect_to admin_users_path, notice: t("admin.users.destroyed")
  end

  def lock
    user.lock_access!
    redirect_to admin_user_path(user), notice: t("admin.users.locked")
  end

  def unlock
    user.unlock_access!
    redirect_to admin_user_path(user), notice: t("admin.users.unlocked")
  end

  private

  def user
    @user ||= User.includes(:accounts).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :sudo)
  end

end
