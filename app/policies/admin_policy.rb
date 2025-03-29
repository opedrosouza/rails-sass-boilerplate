# frozen_string_literal: true

class AdminPolicy
  attr_reader :user

  def initialize(user, _record)
    @user = user
  end

  def index?
    user.is_a? Admin
  end

  def show?
    user.is_a? Admin
  end

  def create?
    user.is_a? Admin
  end

  def new?
    create?
  end

  def update?
    user.is_a? Admin
  end

  def edit?
    update?
  end

  def destroy?
    user.is_a? Admin
  end
end
