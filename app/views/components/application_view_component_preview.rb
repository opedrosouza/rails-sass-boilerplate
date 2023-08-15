# frozen_string_literal: true

class ApplicationViewComponentPreview < ViewComponentContrib::Preview::Base

  include ApplicationHelper
  include CurrentHelper
  extend Dry::Initializer

  self.abstract_class = true

  layout "preview"

end
