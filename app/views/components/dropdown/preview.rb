# frozen_string_literal: true

class Dropdown::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param name
  # @param button_text
  # @param items
  # @param custom_classes
  def default(
    name: "dropdown-1",
    button_text: "Click me to drop",
    items: [{ title: "Home", action: "/" }, { title: "Item 2", action: "#" }],
    custom_classes: nil
  )
    component("dropdown", name:, items:, button_text:, custom_classes:)
  end

end
