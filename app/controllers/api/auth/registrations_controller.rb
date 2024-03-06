# frozen_string_literal: true
class Api::Auth::RegistrationsController < Api::ApplicationController

  skip_before_action :doorkeeper_authorize!, only: [:create]

  def create
    client_app = Doorkeeper::Application.find_by(uid: params[:client_id])

    # Validates Application Exists
    return render json: { error: "Invalid client_id" }, status: :unauthorized unless client_app

    # Validates password confirmation
    if user_params[:password] != user_params[:password_confirmation]
      return render json: { error: "Password confirmation doesn't match Password" },
                    status: :unprocessable_entity
    end

    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

end
