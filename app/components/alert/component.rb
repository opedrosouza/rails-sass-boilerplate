# frozen_string_literal: true

class Alert::Component < ApplicationComponent

  attr_reader :message, :type, :custom_classes

  def initialize(message:, type: :success, custom_classes: nil) # rubocop:disable Lint/MissingSuper
    @message = message
    @type = type
    @custom_classes = custom_classes
  end

  def switch_bg_color
    case type
    when :success
      "bg-green-50 border border-b border-green-200 dark:border-green-700 lg:py-4 dark:bg-green-800"
    when :alert
      "bg-yellow-50 border border-b border-yellow-200 dark:border-yellow-700 lg:py-4 dark:bg-yellow-800"
    when :error
      "bg-red-50 border border-b border-red-200 dark:border-red-700 lg:py-4 dark:bg-red-800"
    else
      "bg-gray-50 border border-b border-gray-200 dark:border-gray-700 lg:py-4 dark:bg-gray-800"
    end
  end

  def switch_text_color
    case type
    when :success
      "text-green-500 dark:text-green-400"
    when :alert
      "text-yellow-500 dark:text-yellow-400"
    when :error
      "text-red-500 dark:text-red-400"
    else
      "text-gray-500 dark:text-gray-400"
    end
  end

  def render?
    message.present?
  end

end
