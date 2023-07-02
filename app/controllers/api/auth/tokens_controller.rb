# frozen_string_literal: true

class Api::Auth::TokensController < Doorkeeper::TokensController

  after_action :update_user, only: [:create] # rubocop:disable Rails/LexicallyScopedActionFilter

  private

  # Update the user's sign in stats after a successful login or refresh through the API.
  def update_user
    return if authorize_response.is_a?(Doorkeeper::OAuth::ErrorResponse)

    user_id = authorize_response&.token&.resource_owner_id

    return if user_id.nil?

    user  = User.find(user_id)
    timer = Time.current
    user.update!(last_sign_in_at: timer, current_sign_in_at: timer, sign_in_count: user.sign_in_count + 1)
  end

end
