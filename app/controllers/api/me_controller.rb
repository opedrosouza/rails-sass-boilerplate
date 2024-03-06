# frozen_string_literal: true

class Api::MeController < Api::ApplicationController

  def show
    render json: current_user, status: :ok
  end

end
