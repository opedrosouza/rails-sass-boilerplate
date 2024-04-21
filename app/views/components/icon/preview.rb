# frozen_string_literal: true

class Icon::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  def angle_down
    component("icon", name: "angle_down")
  end

  def angle_left
    component("icon", name: "angle_left")
  end

  def angle_right
    component("icon", name: "angle_right")
  end

  def angle_up
    component("icon", name: "angle_up")
  end

end
