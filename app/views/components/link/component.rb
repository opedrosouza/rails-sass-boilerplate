# frozen_string_literal: true

class Link::Component < ApplicationViewComponent

  option :path, required: true
  option :text, required: true
  option :data, default: proc { {} }

end
