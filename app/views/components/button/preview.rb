# frozen_string_literal: true

class Button::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param value
  # @param variant
  # @param size
  # @param outline
  # @param custom_classes
  def primary(value: "Click me", variant: "primary", size: "sm", outline: false, custom_classes: "")
    component("button", value:, variant:, size:, outline:, custom_classes:)
  end

  # @param value
  # @param variant
  # @param size
  # @param outline
  # @param custom_classes
  def seconday(value: "Click me", variant: "secondary", size: "sm", outline: false, custom_classes: "")
    component("button", value:, variant:, size:, outline:, custom_classes:)
  end

  # @param value
  # @param variant
  # @param size
  # @param outline
  # @param custom_classes
  def tertiary(value: "Click me", variant: "tertiary", size: "sm", outline: false, custom_classes: "")
    component("button", value:, variant:, size:, outline:, custom_classes:)
  end

end
