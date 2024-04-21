# frozen_string_literal: true

class Button::Component < ApplicationViewComponent

  option :value, required: true
  option :data, optional: true
  option :path, optional: true
  option :method, default: proc { :get }
  option :type, default: proc { "button" }
  option :variant, default: proc { "primary" }
  option :size, optional: true
  option :outline, optional: true
  option :icon_position, optional: true

  renders_one :icon, "Icon::Component"

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

  def controller_data
    return { controller: } if controller
    return { controller: "button--component" } unless multiple_controllers

    { controller: "button--component #{multiple_controllers}" } if multiple_controllers
  end

  def custom_data
    return controller_data.merge(data) if data

    controller_data
  end

end
