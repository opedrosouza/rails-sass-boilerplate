# frozen_string_literal: true

class Alert::Component < ApplicationComponent

  attr_reader :message, :type, :custom_classes

  def initialize(message:, type: :success, custom_classes: nil) # rubocop:disable Lint/MissingSuper
    @message = message
    @type = type
    @custom_classes = custom_classes
  end

  def switch_alert_type
    case type
    when :success
      "alert-success"
    when :alert
      "alert-warning"
    when :error
      "alert-error"
    else
      "alert-info"
    end
  end

  def render?
    message.present?
  end

end
