# frozen_string_literal: true

class Banner::Component < ApplicationViewComponent

  option :message, default: proc {}
  option :timer, default: proc { 5000 }
  option :type, default: proc { :notice }

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
