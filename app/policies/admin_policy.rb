# frozen_string_literal: true

class AdminPolicy

  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def index?
    user.sudo?
  end

  def show?
    user.sudo?
  end

  def create?
    user.sudo?
  end

  def new?
    create?
  end

  def update?
    user.sudo?
  end

  def edit?
    update?
  end

  def destroy?
    user.sudo?
  end

  def lock?
    user.sudo?
  end

  def unlock?
    lock?
  end

  def restore?
    lock?
  end

end
