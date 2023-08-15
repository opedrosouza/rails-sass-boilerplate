# frozen_string_literal: true

class Alert::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  def default
    component("alert", message: "This is a notice message", type: :notice)
  end

  def success
    component("alert", message: "This is a success message", type: :success)
  end

  def alert
    component("alert", message: "This is an alert message", type: :alert)
  end

  def error
    component("alert", message: "This is an error message", type: :error)
  end

  def info
    component("alert", message: "This is an info message", type: :info)
  end

end
