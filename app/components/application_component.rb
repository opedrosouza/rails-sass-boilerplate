# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base

  include ApplicationHelper
  include CurrentHelper

  attr_reader :user

  def initialize(user: nil) # rubocop:disable Lint/MissingSuper
    @user = user
  end

end
