# frozen_string_literal: true
class Current < ActiveSupport::CurrentAttributes

  attribute :user, :account, :request_id, :user_agent, :ip_address

  resets do
    Time.zone = nil
    @account_user = nil
  end

  def user=(value)
    super
    Time.zone = Time.zone
  end

end
