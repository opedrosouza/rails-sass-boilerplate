# frozen_string_literal: true

class Modal::Component < ApplicationViewComponent

  option :title, required: true
  option :errors, required: false, default: proc { [] }
  renders_one :body

end
