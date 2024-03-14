# frozen_string_literal: true

class Modal::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param title
  # @param body
  def default(title: "Modal Title", body: "Modal body")
    component("modal", title:) do |c|
      c.with_body { body }
    end
  end

end
