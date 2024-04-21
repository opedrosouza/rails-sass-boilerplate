#  frozen_string_literal: true

class ApplicationViewComponent < ViewComponentContrib::Base

  extend Dry::Initializer
  include ApplicationHelper
  include CurrentHelper

  option :custom_classes, optional: true
  option :user, optional: true
  option :controller, optional: true
  option :multiple_controllers, optional: true

end
