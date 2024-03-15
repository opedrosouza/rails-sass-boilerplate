# frozen_string_literal: true

class Drawer::Component < ApplicationViewComponent

  option :title, required: true
  option :errors, required: false, default: proc { [] }
  renders_one :body

end
