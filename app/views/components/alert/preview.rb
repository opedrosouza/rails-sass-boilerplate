# frozen_string_literal: true

class Alert::Preview < ApplicationViewComponentPreview

  # You can specify the container class for the default template
  # self.container_class = "w-1/2 border border-gray-300"

  # @param message
  # @param timer
  def default(message: "This is a notice message", timer: 5000)
    component("alert", message:, timer:, type: :notice)
  end

  # @param message
  # @param timer
  def success(message: "This is a success message", timer: 5000)
    component("alert", message:, timer:, type: :success)
  end

  # @param message
  # @param timer
  def alert(message: "This is a alert message", timer: 5000)
    component("alert", message:, timer:, type: :alert)
  end

  # @param message
  # @param timer
  def error(message: "This is a error message", timer: 5000)
    component("alert", message:, timer:, type: :error)
  end

  # @param message
  # @param timer
  def info(message: "This is a info message", timer: 5000)
    component("alert", message:, timer:, type: :info)
  end

end
