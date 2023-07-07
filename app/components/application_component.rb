# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base

  include ApplicationHelper
  include CurrentHelper

  attr_reader :user, :custom_classes

  def initialize(user: nil, custom_classes: nil) # rubocop:disable Lint/MissingSuper
    @user = user
    @custom_classes = custom_classes
  end

end
