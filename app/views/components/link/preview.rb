# frozen_string_literal: true

class Link::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  def default
    component("link", path: "#", text: "Click me")
  end

end
