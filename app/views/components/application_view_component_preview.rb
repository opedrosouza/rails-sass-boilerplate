# frozen_string_literal: true

class ApplicationViewComponentPreview < ViewComponentContrib::Preview::Base

  extend Dry::Initializer
  include ApplicationHelper
  include CurrentHelper

  self.abstract_class = true

  layout "preview"

end
