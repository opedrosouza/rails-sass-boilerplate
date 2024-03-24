# frozen_string_literal: true

class Button::Component < ApplicationViewComponent

  option :value, required: true
  option :data, default: proc { {} }
  option :path, default: proc { "#" }
  option :method, default: proc { :get }
  option :variant, default: proc { "primary" }
  option :size, default: proc { "md" }
  option :outline, default: proc { false }

  def size_style
    case size
    when "sm"
      "button__component-sm"
    when "lg"
      "button__component-lg"
    end
  end

  def outline_style
    outline ? "button__component-outline" : ""
  end

end
