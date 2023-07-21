# frozen_string_literal: true

class Alert::Component < ApplicationComponent

  attr_reader :message, :type

  def initialize(message:, type: :success, custom_classes: nil)
    super()
    @message = message
    @type = type
    @custom_classes = custom_classes
  end

  def switch_alert_type
    case type
    when :success || :notice
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
