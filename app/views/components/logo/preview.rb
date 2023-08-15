# frozen_string_literal: true

class Logo::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param title text
  # @param image_path text
  # @param custom_classes text
  def default(title: "Boilerplate", image_path: nil, custom_classes: nil)
    component("logo", title:, image_path:, custom_classes:)
  end

end
