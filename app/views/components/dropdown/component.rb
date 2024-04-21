# frozen_string_literal: true

class Dropdown::Component < ApplicationViewComponent

  option :name, required: true
  option :button_text, default: proc { "Dropdown" }
  option :items, default: proc { [] }

end
